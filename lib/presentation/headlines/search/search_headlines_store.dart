import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';
import 'package:news_flutter/domain/articles/article.dart';
import 'package:news_flutter/domain/articles/get_articles.dart';
import 'package:news_flutter/presentation/headlines/headlines_category.dart';
import 'package:news_flutter/presentation/headlines/headlines_country.dart';

part 'search_headlines_store.g.dart';

class SearchHeadlinesStore = SearchHeadlinesBase with _$SearchHeadlinesStore;

abstract class SearchHeadlinesBase with Store {
  SearchHeadlinesBase({required this.getArticles});

  final GetArticles getArticles;

  static const _pageSize = 10;

  @observable
  Observable<SearchHeadlinesListState> listState = Observable(
      const SearchHeadlinesListState(
          articles: null, error: null, nextPageKey: null));

  @observable
  Observable<String> _query = Observable("");

  @observable
  Observable<bool> isActive = Observable(false);

  @observable
  Observable<HeadlinesCountry?> selectedCountry = Observable(null);

  final List<HeadlinesCountry> availableCountries =
      Set.of(HeadlinesCountry.values).toList();

  final List<HeadlinesCategory> availableCategories =
      Set.of(HeadlinesCategory.values).toList();

  @observable
  Observable<HeadlinesCategory?> selectedCategory = Observable(null);

  @action
  void _checkIfActiveAndUpdateState() {
    isActive.value = _query.value.isNotEmpty ||
        selectedCountry.value != null ||
        selectedCategory.value != null;

    if (!isActive.value) {
      _updateListState(const SearchHeadlinesListState(
          articles: null, error: null, nextPageKey: null));

      return;
    }

    _updateListState(const SearchHeadlinesListState(
        articles: null, error: null, nextPageKey: 1));
  }

  @action
  void onCategoryChanged(HeadlinesCategory? category) {
    if (category != null && !availableCategories.contains(category)) return;
    if (selectedCategory.value == category) return;

    selectedCategory.value = category;
    _checkIfActiveAndUpdateState();
  }

  @action
  void onCountryChanged(HeadlinesCountry? country) {
    if (country != null && !availableCountries.contains(country)) return;
    if (selectedCountry.value == country) return;

    selectedCountry.value = country;
    _checkIfActiveAndUpdateState();
  }

  @action
  void onQueryChanged(String value) {
    if (value.trim().isEmpty && _query.value.isEmpty) return;
    if (_query.value == value) return;

    _query.value = value;
    _checkIfActiveAndUpdateState();
  }

  @action
  void fetchArticles(int page) {
    getArticles(
      page: page,
      pageSize: _pageSize,
      country: selectedCountry.value,
      category: selectedCategory.value,
      nonEmptyQuery: _query.value,
    ).then((value) => value.fold((left) {
          _updateListState(SearchHeadlinesListState(
              articles: listState.value.articles,
              error: page == 1
                  ? SearchHeadlinesError(key: SearchHeadlinesErrorKey.firstPage)
                  : SearchHeadlinesError(key: SearchHeadlinesErrorKey.nextPage),
              nextPageKey: listState.value.nextPageKey));
        }, (right) {
          final isLastPage = right.list.length < _pageSize;
          final nextPageKey = isLastPage ? null : page + 1;

          final List<Article> newArticles = page == 1
              ? Set.of(right.list
                      .where((element) => element.url != "https://removed.com"))
                  .toList()
              : (Set.of(listState.value.articles ?? List<Article>.empty())
                    ..addAll(right.list))
                  .where((element) => element.url != "https://removed.com")
                  .toList();

          _updateListState(SearchHeadlinesListState(
              articles: newArticles, error: null, nextPageKey: nextPageKey));
        }));
  }

  @action
  void _updateListState(SearchHeadlinesListState state) {
    listState.value = state;
  }
}

final class SearchHeadlinesListState {
  const SearchHeadlinesListState(
      {required this.articles, required this.error, required this.nextPageKey});

  final List<Article>? articles;
  final SearchHeadlinesError? error;
  final int? nextPageKey;
}

class SearchHeadlinesError extends Error {
  final SearchHeadlinesErrorKey key;

  SearchHeadlinesError({required this.key});
}

enum SearchHeadlinesErrorKey { firstPage, nextPage }
