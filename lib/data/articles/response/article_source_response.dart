import 'package:freezed_annotation/freezed_annotation.dart';

part 'article_source_response.g.dart';

part 'article_source_response.freezed.dart';

@freezed
class ArticleSourceResponse with _$ArticleSourceResponse {
  const factory ArticleSourceResponse({
    required String name

  }) =
  _ArticleSourceResponse;

  factory ArticleSourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ArticleSourceResponseFromJson(json);
}
