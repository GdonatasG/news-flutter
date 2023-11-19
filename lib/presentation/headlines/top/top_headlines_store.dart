import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:news_flutter/domain/articles/article.dart';
import 'package:news_flutter/domain/articles/get_articles.dart';
import 'package:news_flutter/presentation/headlines/headlines_country.dart';

part 'top_headlines_store.g.dart';

class TopHeadlinesStore = TopHeadlinesBase with _$TopHeadlinesStore;

abstract class TopHeadlinesBase with Store {
  TopHeadlinesBase({required this.getArticles});

  final GetArticles getArticles;

  static const _pageSize = 10;

  @observable
  Observable<TopHeadlinesListState> listState = Observable(
      const TopHeadlinesListState(
          articles: null, error: null, nextPageKey: null));

  @observable
  Observable<HeadlinesCountry> selectedCountry =
      Observable(HeadlinesCountry.us);

  final List<HeadlinesCountry> availableCountries =
      Set.of(HeadlinesCountry.values).toList();

  @action
  void onCountryChanged(HeadlinesCountry country) {
    if (!availableCountries.contains(country)) return;
    if (selectedCountry.value == country) return;

    selectedCountry.value = country;

    _updateListState(const TopHeadlinesListState(
        articles: null, error: null, nextPageKey: 1));
  }

  @action
  void fetchArticles(int page) {
    getArticles(
      page: page,
      pageSize: _pageSize,
      country: selectedCountry.value,
    ).then((value) => value.fold((left) {
          _updateListState(TopHeadlinesListState(
              articles: listState.value.articles,
              error: page == 1
                  ? TopHeadlinesError(key: TopHeadlinesErrorKey.firstPage)
                  : TopHeadlinesError(key: TopHeadlinesErrorKey.nextPage),
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

          _updateListState(TopHeadlinesListState(
              articles: newArticles, error: null, nextPageKey: nextPageKey));
        }));
  }

  @action
  void _updateListState(TopHeadlinesListState state) {
    listState.value = state;
  }
}

final class TopHeadlinesListState {
  const TopHeadlinesListState(
      {required this.articles, required this.error, required this.nextPageKey});

  final List<Article>? articles;
  final TopHeadlinesError? error;
  final int? nextPageKey;
}

class TopHeadlinesError extends Error {
  final TopHeadlinesErrorKey key;

  TopHeadlinesError({required this.key});
}

enum TopHeadlinesErrorKey { firstPage, nextPage }
