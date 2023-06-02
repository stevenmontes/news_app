import 'package:flutter/material.dart';
import 'package:news_app/src/models/news_models.dart';
import 'package:http/http.dart' as http;

class NewsService extends ChangeNotifier {
  final _baseUrl = 'newsapi.org';
  final _apiKey = 'b7541b7a27fc488aa4a8527eb594f723';

  List<Article> headlines = [];

  NewsService() {
    getTopHeadlines();
  }

  getTopHeadlines() async {
    final url = Uri.https(
        _baseUrl, 'v2/top-headlines', {'country': 'ca', 'apikey': _apiKey});
    final response = await http.get(url);
    final newsResponse = NewsResponse.fromJson(response.body);
    headlines.addAll(newsResponse.articles);
    notifyListeners();
  }
}
