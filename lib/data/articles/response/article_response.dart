import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news_flutter/data/articles/response/article_source_response.dart';

part 'article_response.g.dart';

part 'article_response.freezed.dart';

@freezed
class ArticleResponse with _$ArticleResponse {
  const factory ArticleResponse(
      {required String url,
      required String title,
      required String? urlToImage,
      required String? author,
      required String? description,
      required String publishedAt,
      required ArticleSourceResponse source,
      required String? content}) = _ArticleResponse;

  factory ArticleResponse.fromJson(Map<String, dynamic> json) =>
      _$ArticleResponseFromJson(json);
}
