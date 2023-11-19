// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'article_source_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ArticleSourceResponse _$ArticleSourceResponseFromJson(
    Map<String, dynamic> json) {
  return _ArticleSourceResponse.fromJson(json);
}

/// @nodoc
mixin _$ArticleSourceResponse {
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArticleSourceResponseCopyWith<ArticleSourceResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticleSourceResponseCopyWith<$Res> {
  factory $ArticleSourceResponseCopyWith(ArticleSourceResponse value,
          $Res Function(ArticleSourceResponse) then) =
      _$ArticleSourceResponseCopyWithImpl<$Res, ArticleSourceResponse>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class _$ArticleSourceResponseCopyWithImpl<$Res,
        $Val extends ArticleSourceResponse>
    implements $ArticleSourceResponseCopyWith<$Res> {
  _$ArticleSourceResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ArticleSourceResponseImplCopyWith<$Res>
    implements $ArticleSourceResponseCopyWith<$Res> {
  factory _$$ArticleSourceResponseImplCopyWith(
          _$ArticleSourceResponseImpl value,
          $Res Function(_$ArticleSourceResponseImpl) then) =
      __$$ArticleSourceResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$ArticleSourceResponseImplCopyWithImpl<$Res>
    extends _$ArticleSourceResponseCopyWithImpl<$Res,
        _$ArticleSourceResponseImpl>
    implements _$$ArticleSourceResponseImplCopyWith<$Res> {
  __$$ArticleSourceResponseImplCopyWithImpl(_$ArticleSourceResponseImpl _value,
      $Res Function(_$ArticleSourceResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$ArticleSourceResponseImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ArticleSourceResponseImpl implements _ArticleSourceResponse {
  const _$ArticleSourceResponseImpl({required this.name});

  factory _$ArticleSourceResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArticleSourceResponseImplFromJson(json);

  @override
  final String name;

  @override
  String toString() {
    return 'ArticleSourceResponse(name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArticleSourceResponseImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ArticleSourceResponseImplCopyWith<_$ArticleSourceResponseImpl>
      get copyWith => __$$ArticleSourceResponseImplCopyWithImpl<
          _$ArticleSourceResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArticleSourceResponseImplToJson(
      this,
    );
  }
}

abstract class _ArticleSourceResponse implements ArticleSourceResponse {
  const factory _ArticleSourceResponse({required final String name}) =
      _$ArticleSourceResponseImpl;

  factory _ArticleSourceResponse.fromJson(Map<String, dynamic> json) =
      _$ArticleSourceResponseImpl.fromJson;

  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$ArticleSourceResponseImplCopyWith<_$ArticleSourceResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
