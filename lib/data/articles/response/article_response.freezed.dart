// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'article_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ArticleResponse _$ArticleResponseFromJson(Map<String, dynamic> json) {
  return _ArticleResponse.fromJson(json);
}

/// @nodoc
mixin _$ArticleResponse {
  String get url => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get urlToImage => throw _privateConstructorUsedError;
  String? get author => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String get publishedAt => throw _privateConstructorUsedError;
  ArticleSourceResponse get source => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArticleResponseCopyWith<ArticleResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticleResponseCopyWith<$Res> {
  factory $ArticleResponseCopyWith(
          ArticleResponse value, $Res Function(ArticleResponse) then) =
      _$ArticleResponseCopyWithImpl<$Res, ArticleResponse>;
  @useResult
  $Res call(
      {String url,
      String title,
      String? urlToImage,
      String? author,
      String? description,
      String publishedAt,
      ArticleSourceResponse source,
      String? content});

  $ArticleSourceResponseCopyWith<$Res> get source;
}

/// @nodoc
class _$ArticleResponseCopyWithImpl<$Res, $Val extends ArticleResponse>
    implements $ArticleResponseCopyWith<$Res> {
  _$ArticleResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? title = null,
    Object? urlToImage = freezed,
    Object? author = freezed,
    Object? description = freezed,
    Object? publishedAt = null,
    Object? source = null,
    Object? content = freezed,
  }) {
    return _then(_value.copyWith(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      urlToImage: freezed == urlToImage
          ? _value.urlToImage
          : urlToImage // ignore: cast_nullable_to_non_nullable
              as String?,
      author: freezed == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      publishedAt: null == publishedAt
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as String,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as ArticleSourceResponse,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ArticleSourceResponseCopyWith<$Res> get source {
    return $ArticleSourceResponseCopyWith<$Res>(_value.source, (value) {
      return _then(_value.copyWith(source: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ArticleResponseImplCopyWith<$Res>
    implements $ArticleResponseCopyWith<$Res> {
  factory _$$ArticleResponseImplCopyWith(_$ArticleResponseImpl value,
          $Res Function(_$ArticleResponseImpl) then) =
      __$$ArticleResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String url,
      String title,
      String? urlToImage,
      String? author,
      String? description,
      String publishedAt,
      ArticleSourceResponse source,
      String? content});

  @override
  $ArticleSourceResponseCopyWith<$Res> get source;
}

/// @nodoc
class __$$ArticleResponseImplCopyWithImpl<$Res>
    extends _$ArticleResponseCopyWithImpl<$Res, _$ArticleResponseImpl>
    implements _$$ArticleResponseImplCopyWith<$Res> {
  __$$ArticleResponseImplCopyWithImpl(
      _$ArticleResponseImpl _value, $Res Function(_$ArticleResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? title = null,
    Object? urlToImage = freezed,
    Object? author = freezed,
    Object? description = freezed,
    Object? publishedAt = null,
    Object? source = null,
    Object? content = freezed,
  }) {
    return _then(_$ArticleResponseImpl(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      urlToImage: freezed == urlToImage
          ? _value.urlToImage
          : urlToImage // ignore: cast_nullable_to_non_nullable
              as String?,
      author: freezed == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      publishedAt: null == publishedAt
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as String,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as ArticleSourceResponse,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ArticleResponseImpl implements _ArticleResponse {
  const _$ArticleResponseImpl(
      {required this.url,
      required this.title,
      required this.urlToImage,
      required this.author,
      required this.description,
      required this.publishedAt,
      required this.source,
      required this.content});

  factory _$ArticleResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArticleResponseImplFromJson(json);

  @override
  final String url;
  @override
  final String title;
  @override
  final String? urlToImage;
  @override
  final String? author;
  @override
  final String? description;
  @override
  final String publishedAt;
  @override
  final ArticleSourceResponse source;
  @override
  final String? content;

  @override
  String toString() {
    return 'ArticleResponse(url: $url, title: $title, urlToImage: $urlToImage, author: $author, description: $description, publishedAt: $publishedAt, source: $source, content: $content)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArticleResponseImpl &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.urlToImage, urlToImage) ||
                other.urlToImage == urlToImage) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.publishedAt, publishedAt) ||
                other.publishedAt == publishedAt) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, url, title, urlToImage, author,
      description, publishedAt, source, content);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ArticleResponseImplCopyWith<_$ArticleResponseImpl> get copyWith =>
      __$$ArticleResponseImplCopyWithImpl<_$ArticleResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArticleResponseImplToJson(
      this,
    );
  }
}

abstract class _ArticleResponse implements ArticleResponse {
  const factory _ArticleResponse(
      {required final String url,
      required final String title,
      required final String? urlToImage,
      required final String? author,
      required final String? description,
      required final String publishedAt,
      required final ArticleSourceResponse source,
      required final String? content}) = _$ArticleResponseImpl;

  factory _ArticleResponse.fromJson(Map<String, dynamic> json) =
      _$ArticleResponseImpl.fromJson;

  @override
  String get url;
  @override
  String get title;
  @override
  String? get urlToImage;
  @override
  String? get author;
  @override
  String? get description;
  @override
  String get publishedAt;
  @override
  ArticleSourceResponse get source;
  @override
  String? get content;
  @override
  @JsonKey(ignore: true)
  _$$ArticleResponseImplCopyWith<_$ArticleResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
