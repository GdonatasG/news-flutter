// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'articles_data_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ArticlesDataResponse _$ArticlesDataResponseFromJson(Map<String, dynamic> json) {
  return _ArticlesDataResponse.fromJson(json);
}

/// @nodoc
mixin _$ArticlesDataResponse {
  int get totalResults => throw _privateConstructorUsedError;
  List<ArticleResponse> get articles => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArticlesDataResponseCopyWith<ArticlesDataResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticlesDataResponseCopyWith<$Res> {
  factory $ArticlesDataResponseCopyWith(ArticlesDataResponse value,
          $Res Function(ArticlesDataResponse) then) =
      _$ArticlesDataResponseCopyWithImpl<$Res, ArticlesDataResponse>;
  @useResult
  $Res call({int totalResults, List<ArticleResponse> articles});
}

/// @nodoc
class _$ArticlesDataResponseCopyWithImpl<$Res,
        $Val extends ArticlesDataResponse>
    implements $ArticlesDataResponseCopyWith<$Res> {
  _$ArticlesDataResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalResults = null,
    Object? articles = null,
  }) {
    return _then(_value.copyWith(
      totalResults: null == totalResults
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int,
      articles: null == articles
          ? _value.articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<ArticleResponse>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ArticlesDataResponseImplCopyWith<$Res>
    implements $ArticlesDataResponseCopyWith<$Res> {
  factory _$$ArticlesDataResponseImplCopyWith(_$ArticlesDataResponseImpl value,
          $Res Function(_$ArticlesDataResponseImpl) then) =
      __$$ArticlesDataResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int totalResults, List<ArticleResponse> articles});
}

/// @nodoc
class __$$ArticlesDataResponseImplCopyWithImpl<$Res>
    extends _$ArticlesDataResponseCopyWithImpl<$Res, _$ArticlesDataResponseImpl>
    implements _$$ArticlesDataResponseImplCopyWith<$Res> {
  __$$ArticlesDataResponseImplCopyWithImpl(_$ArticlesDataResponseImpl _value,
      $Res Function(_$ArticlesDataResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalResults = null,
    Object? articles = null,
  }) {
    return _then(_$ArticlesDataResponseImpl(
      totalResults: null == totalResults
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int,
      articles: null == articles
          ? _value._articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<ArticleResponse>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ArticlesDataResponseImpl implements _ArticlesDataResponse {
  _$ArticlesDataResponseImpl(
      {required this.totalResults,
      required final List<ArticleResponse> articles})
      : _articles = articles;

  factory _$ArticlesDataResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArticlesDataResponseImplFromJson(json);

  @override
  final int totalResults;
  final List<ArticleResponse> _articles;
  @override
  List<ArticleResponse> get articles {
    if (_articles is EqualUnmodifiableListView) return _articles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_articles);
  }

  @override
  String toString() {
    return 'ArticlesDataResponse(totalResults: $totalResults, articles: $articles)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArticlesDataResponseImpl &&
            (identical(other.totalResults, totalResults) ||
                other.totalResults == totalResults) &&
            const DeepCollectionEquality().equals(other._articles, _articles));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, totalResults,
      const DeepCollectionEquality().hash(_articles));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ArticlesDataResponseImplCopyWith<_$ArticlesDataResponseImpl>
      get copyWith =>
          __$$ArticlesDataResponseImplCopyWithImpl<_$ArticlesDataResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArticlesDataResponseImplToJson(
      this,
    );
  }
}

abstract class _ArticlesDataResponse implements ArticlesDataResponse {
  factory _ArticlesDataResponse(
          {required final int totalResults,
          required final List<ArticleResponse> articles}) =
      _$ArticlesDataResponseImpl;

  factory _ArticlesDataResponse.fromJson(Map<String, dynamic> json) =
      _$ArticlesDataResponseImpl.fromJson;

  @override
  int get totalResults;
  @override
  List<ArticleResponse> get articles;
  @override
  @JsonKey(ignore: true)
  _$$ArticlesDataResponseImplCopyWith<_$ArticlesDataResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
