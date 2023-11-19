import 'package:dio/dio.dart';
import 'package:news_flutter/application/articles/article_service.dart';
import 'package:news_flutter/data/articles/response/articles_data_response.dart';
import 'package:retrofit/http.dart';

part 'news_api_article_repository.g.dart';

@RestApi(baseUrl: "https://newsapi.org/v2/")
abstract class NewsAPIArticleRepository {
  factory NewsAPIArticleRepository(Dio dio, {String baseUrl}) =
      _NewsAPIArticleRepository;

  @GET("top-headlines")
  Future<ArticlesDataResponse> getTopHeadlines(
      {@Query("page") required int page,
      @Query("pageSize") required int pageSize,
      @Query("country") ArticleSourceCountry? country,
      @Query("category") ArticleSourceCategory? category,
      @Query("q") String? query});
}

enum ArticleSourceCountry { us, it, lt }

enum ArticleSourceCategory {
  business,
  entertainment,
  general,
  health,
  science,
  sports,
  technology
}
