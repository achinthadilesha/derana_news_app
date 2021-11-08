// ignore_for_file: avoid_print

// dart imports here
import 'dart:convert';

// flutter package imports here
import 'package:http/http.dart' as http;

// local imports here
import '/config/constants.dart';
import '/models/news.dart';

class NewsService {
  // fetch news based on categories
  static Future<List<Article>?> fetchGeneralNews(
      {required String category}) async {
    // url for news api
    final url = Uri.parse(
        '${Constansts.BASE_URL}/top-headlines?country=nz&category=$category&apiKey=${Constansts.API_KEY}');

    /// wrap this section in try catch block
    /// as it might throw error like no-network for api ti trigger .etc
    try {
      final response = await http.get(url);
      // continue if response code is 200
      if (response.statusCode == 200) {
        // decode the response body from json an assign the list to _news
        News _news = News.fromJson(jsonDecode(response.body));

        List<Article>? sources = _news.articles;
        return sources;
      }
    } catch (error) {
      rethrow;
    }
  }

  // fetch news by query search(title only)
  static Future<List<Article>?> fetchNewsBySearch(String? search) async {
    // url for news api
    final url = Uri.parse(
        '${Constansts.BASE_URL}/everything?qInTitle=$search&apiKey=${Constansts.API_KEY}');

    /// wrap this section in try catch block
    /// as it might throw error like no-network for api ti trigger .etc
    try {
      final response = await http.get(url);
      // continue if response code is 200
      if (response.statusCode == 200) {
        // decode the response body from json an assign the list to _news
        News _news = News.fromJson(jsonDecode(response.body));

        List<Article>? sources = _news.articles;
        return sources;
      }
    } catch (error) {
      rethrow;
    }
  }
}
