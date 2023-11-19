import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_flutter/application/articles/article_service.dart';
import 'package:news_flutter/data/articles/news_api_article_repository.dart';
import 'package:news_flutter/domain/articles/get_articles.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class Dependencies extends StatelessWidget {
  final Widget child;

  Dependencies({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: _networking + _repositories + _services + _useCases,
        child: child);
  }

  final List<SingleChildWidget> _networking = [
    Provider<Dio>(create: (_) {
      final dioClient = Dio();

      if (kDebugMode) {
        dioClient.interceptors
            .add(LogInterceptor(requestBody: true, responseBody: true));
      }

      String apiKey = const String.fromEnvironment("NEWS_API_KEY");

      dioClient.options.headers["Authorization"] = "Bearer $apiKey";

      return dioClient;
    })
  ];

  final List<SingleChildWidget> _services = [
    Provider<ArticleService>(
        create: (context) => DefaultArticleService(
            Provider.of<NewsAPIArticleRepository>(context, listen: false)))
  ];

  final List<SingleChildWidget> _repositories = [
    Provider<NewsAPIArticleRepository>(
        create: (context) =>
            NewsAPIArticleRepository(Provider.of<Dio>(context, listen: false)))
  ];

  final List<SingleChildWidget> _useCases = [
    Provider<GetArticles>(
        create: (context) => DefaultGetArticles(
            Provider.of<ArticleService>(context, listen: false)))
  ];
}
