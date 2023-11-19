import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:mobx/mobx.dart';
import 'package:news_flutter/domain/articles/article.dart';
import 'package:news_flutter/presentation/headlines/headlines_category.dart';
import 'package:news_flutter/presentation/headlines/headlines_country.dart';
import 'package:news_flutter/presentation/headlines/search/search_headlines_store.dart';
import 'package:news_flutter/presentation/headlines/widget/headline_details_modal.dart';
import 'package:news_flutter/presentation/headlines/widget/paged_headlines_list.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SearchHeadlinesComponent extends StatefulWidget {
  const SearchHeadlinesComponent({super.key});

  @override
  State<SearchHeadlinesComponent> createState() =>
      _SearchHeadlinesComponentState();
}

class _SearchHeadlinesComponentState extends State<SearchHeadlinesComponent> {
  late SearchHeadlinesStore _store;
  late ReactionDisposer _disposer;
  final PagingController<int, Article> _pagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    super.initState();

    _store = context.read();

    _disposer = reaction((_) => _store.listState.value, (listState) {
      if (!_store.isActive.value) return;

      final SearchHeadlinesError? error = listState.error;

      if (error == null){
        ScaffoldMessenger.of(context).clearSnackBars();
      }

      if (error != null &&
          error.key == SearchHeadlinesErrorKey.firstPage &&
          listState.articles != null) {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              "Unable to load articles!",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Theme.of(context).colorScheme.error),
            ),
            action: SnackBarAction(
              label: 'Retry',
              textColor: Colors.white,
              onPressed: () {
                _pagingController.refresh();
              },
            ),
          ));
        });
      }


      _pagingController.value = PagingState(
        nextPageKey: listState.nextPageKey,
        error: listState.error,
        itemList: listState.articles,
      );
    });

    _pagingController.addPageRequestListener((pageKey) {
      _store.fetchArticles(pageKey);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => Scaffold(
        appBar: PreferredSize(
            preferredSize:
                Size(MediaQuery.of(context).size.width, kToolbarHeight),
            child: HeadlinesSearchBar(
              onBack: () {
                Navigator.of(context).pop();
              },
              onChanged: (value) {
                _store.onQueryChanged(value);
              },
              actions: [
                PopupMenuButton(
                    itemBuilder: (popupContext) {
                      return [
                            PopupMenuItem(
                              child: Text(
                                "All countries",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(
                                        fontWeight:
                                            _store.selectedCountry.value == null
                                                ? FontWeight.bold
                                                : FontWeight.normal),
                              ),
                              onTap: () {
                                _store.onCountryChanged(null);
                              },
                            )
                          ] +
                          _store.availableCountries.map((country) {
                            return PopupMenuItem(
                              child: Row(
                                children: [
                                  country.flag(),
                                  const SizedBox(width: 8.0),
                                  Text(
                                    country.visualName,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall
                                        ?.copyWith(
                                            fontWeight:
                                                _store.selectedCountry.value ==
                                                        country
                                                    ? FontWeight.bold
                                                    : FontWeight.normal),
                                  )
                                ],
                              ),
                              onTap: () {
                                _store.onCountryChanged(country);
                              },
                            );
                          }).toList();
                    },
                    icon: _store.selectedCountry.value != null
                        ? _store.selectedCountry.value?.flag()
                        : const Icon(Icons.flag_outlined))
              ],
            )),
        body: Column(mainAxisSize: MainAxisSize.max, children: [
          SizedBox(
            height: 48,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              itemBuilder: (context, index) => (index == 0)
                  ? Observer(
                      builder: (_) => ChoiceChip(
                        padding: EdgeInsets.all(0),
                        pressElevation: 0,
                        showCheckmark: false,
                        label: const Text("All categories"),
                        selected: _store.selectedCategory.value == null,
                        onSelected: (value) {
                          _store.onCategoryChanged(null);
                        },
                      ),
                    )
                  : Observer(
                      builder: (_) => ChoiceChip(
                        pressElevation: 0,
                        padding: EdgeInsets.all(0),
                        showCheckmark: false,
                        label: Text(
                            _store.availableCategories[index - 1].visualName),
                        selected: _store.selectedCategory.value ==
                            _store.availableCategories[index - 1],
                        onSelected: (value) {
                          _store.onCategoryChanged(
                              _store.availableCategories[index - 1]);
                        },
                      ),
                    ),
              itemCount: _store.availableCategories.length,
              separatorBuilder: (context, index) =>
                  (index < _store.availableCategories.length + 1)
                      ? Container(
                          width: 6.0,
                        )
                      : Container(),
            ),
          ),
          Expanded(
              child: (_store.isActive.value)
                  ? RefreshIndicator(
                      onRefresh: () => Future.sync(
                            () => _pagingController.refresh(),
                          ),
                      child: PagedHeadlinesList(
                        pagingController: _pagingController,
                        onItemClick: (article) {
                          article.details(context: context);
                        },
                      ))
                  : const Center(child: Text("Search headlines")))
        ]),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pagingController.dispose();
    _disposer();
  }
}

class HeadlinesSearchBar extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final VoidCallback onBack;
  final List<Widget>? actions;

  const HeadlinesSearchBar(
      {super.key,
      required this.onChanged,
      required this.onBack,
      required this.actions});

  @override
  State<HeadlinesSearchBar> createState() => _HeadlinesSearchBarState();
}

class _HeadlinesSearchBarState extends State<HeadlinesSearchBar> {
  final StreamController<String> _textChangeStreamController =
      StreamController();
  late StreamSubscription _textChangesSubscription;

  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _textChangesSubscription = _textChangeStreamController.stream
        .debounceTime(const Duration(milliseconds: 500))
        .listen((text) {
      final onChanged = widget.onChanged;
      onChanged(text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Theme.of(context).colorScheme.background,
      surfaceTintColor: Colors.transparent,
      elevation: 0.0,
      scrolledUnderElevation: 0.0,
      leading: IconButton(
        onPressed: () {
          _textEditingController.clear();
          widget.onBack();
        },
        icon: const Icon(Icons.arrow_back_ios_new),
        iconSize: 20.0,
      ),
      title: SizedBox(
        height: 40,
        child: TextField(
          controller: _textEditingController,
          onChanged: (value) {
            setState(() {
              _textEditingController.text = value;
            });
            _textChangeStreamController.add(value);
          },
          autofocus: true,
          autocorrect: false,
          enableSuggestions: false,
          style: Theme.of(context).textTheme.bodySmall,
          maxLines: 1,
          decoration: InputDecoration(
            hintMaxLines: 1,
            hintText: "Search",
            filled: true,
            fillColor:
                Theme.of(context).colorScheme.brightness == Brightness.dark
                    ? Colors.white.withOpacity(0.1)
                    : Colors.black.withOpacity(0.1),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 0),
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(24.0)),
            suffixIcon: _textEditingController.text.isNotEmpty
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        _textEditingController.clear();
                      });
                      widget.onChanged("");
                    },
                    icon: const Icon(Icons.clear),
                    iconSize: 20.0,
                  )
                : null,
          ),
        ),
      ),
      actions: widget.actions,
    );
  }

  @override
  void dispose() {
    super.dispose();

    _textChangeStreamController.close();
    _textChangesSubscription.cancel();
    _textEditingController.dispose();
  }
}
