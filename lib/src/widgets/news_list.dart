import 'package:flutter/material.dart';
import 'package:news_app/src/models/news_models.dart';
import 'package:news_app/src/theme/theme.dart';

class NewsList extends StatelessWidget {
  final List<Article> news;

  const NewsList({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: news.length,
        itemBuilder: (_, int index) {
          return _News(article: news[index], index: index);
        });
  }
}

class _News extends StatelessWidget {
  final Article article;
  final int index;

  const _News({
    required this.article,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CardTopBar(
          article: article,
          index: index,
        ),
        _CardTitle(article: article),
        _CardImage(article: article)
      ],
    );
  }
}

class _CardTopBar extends StatelessWidget {
  final Article article;
  final int index;

  const _CardTopBar({
    required this.article,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text(
            '${index + 1}',
            style: TextStyle(color: myTheme.colorScheme.secondary),
          ),
          Text(
            article.source.name,
          ),
        ],
      ),
    );
  }
}

class _CardTitle extends StatelessWidget {
  final Article article;

  const _CardTitle({required this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        article.title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class _CardImage extends StatelessWidget {
  final Article article;

  const _CardImage({required this.article});

  @override
  Widget build(BuildContext context) {
    return Text('HOla mundo');
  }
}
