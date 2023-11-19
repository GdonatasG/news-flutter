import 'package:equatable/equatable.dart';
import 'package:news_flutter/domain/articles/article.dart';

class Articles extends Equatable {
  const Articles({required this.total, required this.list});

  final int total;
  final List<Article> list;

  @override
  List<Object?> get props => [total, list];
}
