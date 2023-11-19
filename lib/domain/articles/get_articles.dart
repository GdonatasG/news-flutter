import 'dart:io';

import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_flutter/application/articles/article_service.dart';
import 'package:news_flutter/domain/articles/article.dart';
import 'package:news_flutter/domain/articles/articles.dart';
import 'package:news_flutter/presentation/headlines/headlines_country.dart';
import 'package:news_flutter/presentation/headlines/headlines_category.dart';
import 'package:timeago/timeago.dart' as timeago;

abstract class GetArticles {
  Future<Either<Exception, Articles>> call(
      {required int page,
      required int pageSize,
      HeadlinesCountry? country,
      HeadlinesCategory? category,
      String? nonEmptyQuery});
}

class DefaultGetArticles implements GetArticles {
  const DefaultGetArticles(this.articleService);

  final ArticleService articleService;

  @override
  Future<Either<Exception, Articles>> call(
      {required int page,
      required int pageSize,
      HeadlinesCountry? country,
      HeadlinesCategory? category,
      String? nonEmptyQuery}) async {
    return articleService
        .getTopHeadlines(
            page: page,
            pageSize: pageSize,
            country: country,
            category: category,
            query: nonEmptyQuery)
        .fold((left) => Left(left), (right) {
      return Right(Articles(
          total: right.totalResults,
          list: right.articles.map((article) {
            final DateTime? dateTime =
                DateTime.tryParse(article.publishedAt)?.toLocal();
            final String publishedAt =
                dateTime != null ? timeago.format(dateTime) : "-";

            return Article(
                url: article.url,
                title: article.title,
                urlToImage: article.urlToImage ?? "",
                author: article.author ?? "Unknown author",
                content: _getReadableContent(article.content ?? ""),
                source: article.source.name,
                publishedAt: publishedAt);
          }).toList()));
    });
  }

  String _getReadableContent(String value) {
    String targetSubstring = "…";

    final int targetIndex = value.indexOf(targetSubstring);

    if (targetIndex == -1) return value;

    return "${value.substring(0, targetIndex).trim()}...";
  }
}
