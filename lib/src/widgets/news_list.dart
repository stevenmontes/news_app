import 'package:flutter/material.dart';
import 'package:news_app/src/models/news_models.dart';

class NewsList extends StatelessWidget {
  final List<Article> news;

  const NewsList({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: news.length,
        itemBuilder: (_, int index) {
          return Text(news[index].title);
        });
  }
}
