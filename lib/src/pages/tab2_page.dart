import 'package:flutter/material.dart';
import 'package:news_app/src/services/news_service.dart';
import 'package:provider/provider.dart';

class Tab2Page extends StatelessWidget {
  const Tab2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [Expanded(child: _CategoriesListView())],
      ),
    );
  }
}

class _CategoriesListView extends StatelessWidget {
  const _CategoriesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<NewsService>(context).categories;

    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (_, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Icon(categories[index].icon),
                const SizedBox(
                  height: 5,
                ),
                Text(categories[index].name),
              ],
            ),
          );
        });
  }
}
