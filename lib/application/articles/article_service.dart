import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:news_flutter/data/articles/news_api_article_repository.dart';
import 'package:news_flutter/data/articles/response/articles_data_response.dart';
import 'package:news_flutter/presentation/headlines/headlines_category.dart';
import 'package:news_flutter/presentation/headlines/headlines_country.dart';

abstract class ArticleService {
  Future<Either<Exception, ArticlesDataResponse>> getTopHeadlines(
      {required int page,
      required int pageSize,
      HeadlinesCountry? country,
      HeadlinesCategory? category,
      String? query});
}

class DefaultArticleService implements ArticleService {
  const DefaultArticleService(this.client);

  final NewsAPIArticleRepository client;

  @override
  Future<Either<Exception, ArticlesDataResponse>> getTopHeadlines(
      {required int page,
      required int pageSize,
      HeadlinesCountry? country,
      HeadlinesCategory? category,
      String? query}) async {
    assert(country != null || query != null);

    try {
      ArticlesDataResponse response = await client.getTopHeadlines(
          page: page,
          pageSize: pageSize,
          country: country?.toData,
          category: category?.toData,
          query: (query?.isNotEmpty ?? false) ? query : null);

      return Right(response);
    } on DioException catch (exception) {
      return Left(exception);
    }
  }
}

extension HeadlinesCountryExtension on HeadlinesCountry {
  ArticleSourceCountry get toData {
    return switch (this) {
      HeadlinesCountry.us => ArticleSourceCountry.us,
      HeadlinesCountry.it => ArticleSourceCountry.it,
      HeadlinesCountry.lt => ArticleSourceCountry.lt
    };
  }
}

extension HeadlinesCategoryExtension on HeadlinesCategory {
  ArticleSourceCategory get toData {
    return switch (this) {
      HeadlinesCategory.business => ArticleSourceCategory.business,
      HeadlinesCategory.entertainment => ArticleSourceCategory.entertainment,
      HeadlinesCategory.general => ArticleSourceCategory.general,
      HeadlinesCategory.health => ArticleSourceCategory.health,
      HeadlinesCategory.science => ArticleSourceCategory.science,
      HeadlinesCategory.sports => ArticleSourceCategory.sports,
      HeadlinesCategory.technology => ArticleSourceCategory.technology
    };
  }
}
