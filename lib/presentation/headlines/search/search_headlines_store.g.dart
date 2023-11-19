// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_headlines_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SearchHeadlinesStore on SearchHeadlinesBase, Store {
  late final _$listStateAtom =
      Atom(name: 'SearchHeadlinesBase.listState', context: context);

  @override
  Observable<SearchHeadlinesListState> get listState {
    _$listStateAtom.reportRead();
    return super.listState;
  }

  @override
  set listState(Observable<SearchHeadlinesListState> value) {
    _$listStateAtom.reportWrite(value, super.listState, () {
      super.listState = value;
    });
  }

  late final _$_queryAtom =
      Atom(name: 'SearchHeadlinesBase._query', context: context);

  @override
  Observable<String> get _query {
    _$_queryAtom.reportRead();
    return super._query;
  }

  @override
  set _query(Observable<String> value) {
    _$_queryAtom.reportWrite(value, super._query, () {
      super._query = value;
    });
  }

  late final _$isActiveAtom =
      Atom(name: 'SearchHeadlinesBase.isActive', context: context);

  @override
  Observable<bool> get isActive {
    _$isActiveAtom.reportRead();
    return super.isActive;
  }

  @override
  set isActive(Observable<bool> value) {
    _$isActiveAtom.reportWrite(value, super.isActive, () {
      super.isActive = value;
    });
  }

  late final _$selectedCountryAtom =
      Atom(name: 'SearchHeadlinesBase.selectedCountry', context: context);

  @override
  Observable<HeadlinesCountry?> get selectedCountry {
    _$selectedCountryAtom.reportRead();
    return super.selectedCountry;
  }

  @override
  set selectedCountry(Observable<HeadlinesCountry?> value) {
    _$selectedCountryAtom.reportWrite(value, super.selectedCountry, () {
      super.selectedCountry = value;
    });
  }

  late final _$selectedCategoryAtom =
      Atom(name: 'SearchHeadlinesBase.selectedCategory', context: context);

  @override
  Observable<HeadlinesCategory?> get selectedCategory {
    _$selectedCategoryAtom.reportRead();
    return super.selectedCategory;
  }

  @override
  set selectedCategory(Observable<HeadlinesCategory?> value) {
    _$selectedCategoryAtom.reportWrite(value, super.selectedCategory, () {
      super.selectedCategory = value;
    });
  }

  late final _$SearchHeadlinesBaseActionController =
      ActionController(name: 'SearchHeadlinesBase', context: context);

  @override
  void _checkIfActiveAndUpdateState() {
    final _$actionInfo = _$SearchHeadlinesBaseActionController.startAction(
        name: 'SearchHeadlinesBase._checkIfActiveAndUpdateState');
    try {
      return super._checkIfActiveAndUpdateState();
    } finally {
      _$SearchHeadlinesBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onCategoryChanged(HeadlinesCategory? category) {
    final _$actionInfo = _$SearchHeadlinesBaseActionController.startAction(
        name: 'SearchHeadlinesBase.onCategoryChanged');
    try {
      return super.onCategoryChanged(category);
    } finally {
      _$SearchHeadlinesBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onCountryChanged(HeadlinesCountry? country) {
    final _$actionInfo = _$SearchHeadlinesBaseActionController.startAction(
        name: 'SearchHeadlinesBase.onCountryChanged');
    try {
      return super.onCountryChanged(country);
    } finally {
      _$SearchHeadlinesBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onQueryChanged(String value) {
    final _$actionInfo = _$SearchHeadlinesBaseActionController.startAction(
        name: 'SearchHeadlinesBase.onQueryChanged');
    try {
      return super.onQueryChanged(value);
    } finally {
      _$SearchHeadlinesBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void fetchArticles(int page) {
    final _$actionInfo = _$SearchHeadlinesBaseActionController.startAction(
        name: 'SearchHeadlinesBase.fetchArticles');
    try {
      return super.fetchArticles(page);
    } finally {
      _$SearchHeadlinesBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _updateListState(SearchHeadlinesListState state) {
    final _$actionInfo = _$SearchHeadlinesBaseActionController.startAction(
        name: 'SearchHeadlinesBase._updateListState');
    try {
      return super._updateListState(state);
    } finally {
      _$SearchHeadlinesBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listState: ${listState},
isActive: ${isActive},
selectedCountry: ${selectedCountry},
selectedCategory: ${selectedCategory}
    ''';
  }
}
