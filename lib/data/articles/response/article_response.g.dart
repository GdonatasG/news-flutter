// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArticleResponseImpl _$$ArticleResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ArticleResponseImpl(
      url: json['url'] as String,
      title: json['title'] as String,
      urlToImage: json['urlToImage'] as String?,
      author: json['author'] as String?,
      description: json['description'] as String?,
      publishedAt: json['publishedAt'] as String,
      source: ArticleSourceResponse.fromJson(
          json['source'] as Map<String, dynamic>),
      content: json['content'] as String?,
    );

Map<String, dynamic> _$$ArticleResponseImplToJson(
        _$ArticleResponseImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
      'title': instance.title,
      'urlToImage': instance.urlToImage,
      'author': instance.author,
      'description': instance.description,
      'publishedAt': instance.publishedAt,
      'source': instance.source,
      'content': instance.content,
    };
