import 'dart:convert';

import 'package:aplikasi_berita/data/model/BeritaHeadlineModel.dart';
import 'package:http/http.dart' as http;

class NewsAPIService {
  static const String _apiKey = "8780d167b9ac4cacbc70da769ff4d269";


  Future<List<BeritaHeadlineModel>> fetchHeadlines({
    String? country,
    String? category,
    String? sources,
    int? page,
    int? pageSize,
  }) async {

    Map<String, dynamic> queryParams;

    if(sources != null) {
      queryParams = {
        'sources': sources,
        'page': page?.toString(),
        'pageSize': pageSize?.toString(),
        'apiKey': _apiKey,
      };
    } else {
      queryParams = {
        'country': country,
        'category': category,
        'page': page?.toString(),
        'pageSize': pageSize?.toString(),
        'apiKey': _apiKey,
      };
    }

    // Remove null values
    queryParams.removeWhere((key, value) => value == null);

    const _baseURL = 'https://newsapi.org/v2';

    final uri = Uri.parse('$_baseURL/top-headlines').replace(
      queryParameters: queryParams.map((k, v) => MapEntry(k, v.toString())),
    );
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return (data['articles'] as List)
          .map((e) => BeritaHeadlineModel.fromJson(e))
          .toList();
    } else {
      throw Exception('Failed to load headlines');
    }
  }
}