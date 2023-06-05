import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/src/models/news_models.dart';
import 'package:http/http.dart' as http;

import '../models/category_model.dart';

class NewsService extends ChangeNotifier {
  final _baseUrl = 'newsapi.org';
  final _apiKey = 'b7541b7a27fc488aa4a8527eb594f723';

  Map<String, List<Article>> categoryArticles = {};
  List<Article> headlines = [];
  List<Category> categories = [
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.tv, 'entertainment'),
    Category(FontAwesomeIcons.addressCard, 'general'),
    Category(FontAwesomeIcons.headSideVirus, 'health'),
    Category(FontAwesomeIcons.vials, 'science'),
    Category(FontAwesomeIcons.volleyball, 'sports'),
    Category(FontAwesomeIcons.memory, 'technology'),
  ];

  String _selectedCategory = 'business';

  NewsService() {
    getTopHeadlines();

    for (var category in categories) {
      categoryArticles[category.name] = [];
    }
  }

  String get selectedCategory => _selectedCategory;

  set selectedCategory(String value) {
    _selectedCategory = value;
    getArticlesByCategory(value);
    notifyListeners();
  }

  getTopHeadlines() async {
    final url = Uri.https(
        _baseUrl, 'v2/top-headlines', {'country': 'ca', 'apikey': _apiKey});
    final response = await http.get(url);
    final newsResponse = NewsResponse.fromJson(response.body);
    headlines.addAll(newsResponse.articles);
    notifyListeners();
  }

  getArticlesByCategory(String category) async {
    if (categoryArticles[category]!.isNotEmpty) {
      return categoryArticles[category];
    }

    final url = Uri.https(_baseUrl, 'v2/top-headlines',
        {'country': 'ca', 'apikey': _apiKey, 'category': category});
    final response = await http.get(url);
    final newsResponse = NewsResponse.fromJson(response.body);
    categoryArticles[category]!.addAll(newsResponse.articles);
    notifyListeners();
  }
}
