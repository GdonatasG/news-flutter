import 'package:equatable/equatable.dart';

class Article extends Equatable {
  const Article(
      {required this.url,
      required this.title,
      required this.urlToImage,
      required this.author,
      required this.content,
      required this.source,
      required this.publishedAt});

  final String url;
  final String urlToImage;
  final String author;
  final String content;
  final String source;
  final String publishedAt;
  final String title;

  @override
  List<Object?> get props => [url];
}
