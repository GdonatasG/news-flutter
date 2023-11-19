import 'package:flutter/material.dart';
import 'package:news_flutter/domain/articles/get_articles.dart';
import 'package:news_flutter/presentation/headlines/top/top_headlines_component.dart';
import 'package:news_flutter/presentation/headlines/top/top_headlines_store.dart';
import 'package:provider/provider.dart';

class TopHeadlinesPage extends StatelessWidget {
  const TopHeadlinesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) =>
          TopHeadlinesStore(getArticles: context.read<GetArticles>()),
      child: const TopHeadlinesComponent(),
    );
  }
}
