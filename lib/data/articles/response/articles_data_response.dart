import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news_flutter/data/articles/response/article_response.dart';

part 'articles_data_response.g.dart';

part 'articles_data_response.freezed.dart';

@freezed
class ArticlesDataResponse with _$ArticlesDataResponse {
  factory ArticlesDataResponse(
      {required int totalResults,
      required List<ArticleResponse> articles}) = _ArticlesDataResponse;

  factory ArticlesDataResponse.fromJson(Map<String, dynamic> json) =>
      _$ArticlesDataResponseFromJson(json);
}
