import 'package:flutter/material.dart';
import 'package:news_flutter/domain/articles/get_articles.dart';
import 'package:news_flutter/presentation/headlines/search/search_headlines_component.dart';
import 'package:news_flutter/presentation/headlines/search/search_headlines_store.dart';
import 'package:provider/provider.dart';

class SearchHeadlinesPage extends StatelessWidget {
  static const String route = "search_headlines";

  const SearchHeadlinesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) =>
          SearchHeadlinesStore(getArticles: context.read<GetArticles>()),
      child: const SearchHeadlinesComponent(),
    );
  }
}
