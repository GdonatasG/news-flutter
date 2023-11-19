// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'articles_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArticlesDataResponseImpl _$$ArticlesDataResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ArticlesDataResponseImpl(
      totalResults: json['totalResults'] as int,
      articles: (json['articles'] as List<dynamic>)
          .map((e) => ArticleResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ArticlesDataResponseImplToJson(
        _$ArticlesDataResponseImpl instance) =>
    <String, dynamic>{
      'totalResults': instance.totalResults,
      'articles': instance.articles,
    };
