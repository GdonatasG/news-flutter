// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_headlines_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TopHeadlinesStore on TopHeadlinesBase, Store {
  late final _$listStateAtom =
      Atom(name: 'TopHeadlinesBase.listState', context: context);

  @override
  Observable<TopHeadlinesListState> get listState {
    _$listStateAtom.reportRead();
    return super.listState;
  }

  @override
  set listState(Observable<TopHeadlinesListState> value) {
    _$listStateAtom.reportWrite(value, super.listState, () {
      super.listState = value;
    });
  }

  late final _$selectedCountryAtom =
      Atom(name: 'TopHeadlinesBase.selectedCountry', context: context);

  @override
  Observable<HeadlinesCountry> get selectedCountry {
    _$selectedCountryAtom.reportRead();
    return super.selectedCountry;
  }

  @override
  set selectedCountry(Observable<HeadlinesCountry> value) {
    _$selectedCountryAtom.reportWrite(value, super.selectedCountry, () {
      super.selectedCountry = value;
    });
  }

  late final _$TopHeadlinesBaseActionController =
      ActionController(name: 'TopHeadlinesBase', context: context);

  @override
  void onCountryChanged(HeadlinesCountry country) {
    final _$actionInfo = _$TopHeadlinesBaseActionController.startAction(
        name: 'TopHeadlinesBase.onCountryChanged');
    try {
      return super.onCountryChanged(country);
    } finally {
      _$TopHeadlinesBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void fetchArticles(int page) {
    final _$actionInfo = _$TopHeadlinesBaseActionController.startAction(
        name: 'TopHeadlinesBase.fetchArticles');
    try {
      return super.fetchArticles(page);
    } finally {
      _$TopHeadlinesBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _updateListState(TopHeadlinesListState state) {
    final _$actionInfo = _$TopHeadlinesBaseActionController.startAction(
        name: 'TopHeadlinesBase._updateListState');
    try {
      return super._updateListState(state);
    } finally {
      _$TopHeadlinesBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listState: ${listState},
selectedCountry: ${selectedCountry}
    ''';
  }
}
