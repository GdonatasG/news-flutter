import 'dart:async';

import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:mobx/mobx.dart';
import 'package:news_flutter/domain/articles/article.dart';
import 'package:news_flutter/presentation/headlines/headlines_country.dart';
import 'package:news_flutter/presentation/headlines/search/search_headlines_page.dart';
import 'package:news_flutter/presentation/headlines/top/top_headlines_store.dart';
import 'package:news_flutter/presentation/headlines/widget/headline_details_modal.dart';
import 'package:news_flutter/presentation/headlines/widget/paged_headlines_list.dart';
import 'package:provider/provider.dart';

class TopHeadlinesComponent extends StatefulWidget {
  const TopHeadlinesComponent({super.key});

  @override
  State<TopHeadlinesComponent> createState() => _TopHeadlinesComponentState();
}

class _TopHeadlinesComponentState extends State<TopHeadlinesComponent> {
  late TopHeadlinesStore _store;
  late ReactionDisposer _disposer;
  final PagingController<int, Article> _pagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    super.initState();

    _store = context.read();

    _disposer = reaction((_) => _store.listState.value, (listState) {
      final TopHeadlinesError? error = listState.error;

      if (error == null) {
        ScaffoldMessenger.of(context).clearSnackBars();
      }

      if (error != null &&
          error.key == TopHeadlinesErrorKey.firstPage &&
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
        body: RefreshIndicator(
          edgeOffset: MediaQuery.of(context).padding.top,
          onRefresh: () => Future.sync(
            () => _pagingController.refresh(),
          ),
          child: CustomScrollView(slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Theme.of(context).colorScheme.background,
              surfaceTintColor: Colors.transparent,
              elevation: 0.0,
              scrolledUnderElevation: 0.0,
              floating: true,
              systemOverlayStyle:
                  Theme.of(context).brightness == Brightness.dark
                      ? SystemUiOverlayStyle.light.copyWith(
                          statusBarColor: Theme.of(context)
                              .colorScheme
                              .background
                              .withOpacity(0.8))
                      : SystemUiOverlayStyle.dark.copyWith(
                          statusBarColor: Theme.of(context)
                              .colorScheme
                              .background
                              .withOpacity(0.8)),
              title: const Text("Top Headlines"),
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(SearchHeadlinesPage.route);
                    },
                    icon: const Icon(Icons.search)),
                PopupMenuButton(
                  itemBuilder: (popupContext) {
                    return _store.availableCountries.map((country) {
                      return PopupMenuItem(
                        child: StatefulBuilder(
                          builder: (context, _) => Row(
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
                        ),
                        onTap: () {
                          _store.onCountryChanged(country);
                        },
                      );
                    }).toList();
                  },
                  icon: _store.selectedCountry.value.flag(),
                ),
              ],
            ),
            PagedHeadlinesList(
                pagingController: _pagingController,
                sliver: true,
                onItemClick: (article) {
                  article.details(context: context);
                }),
            SliverToBoxAdapter(
              child: Container(
                height: MediaQuery.of(context).padding.bottom,
              ),
            )
          ]),
        ),
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
