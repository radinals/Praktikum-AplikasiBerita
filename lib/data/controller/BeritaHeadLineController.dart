import 'package:aplikasi_berita/data/sources/NewsAPIService.dart';
import 'package:aplikasi_berita/view/widget/CardHeadlineNews.dart';
import 'package:flutter/material.dart';

class BeritaHeadLineController extends ChangeNotifier{

  NewsAPIService _apiService = NewsAPIService();

  BeritaHeadLineController();

  Future<List<CardHeadlineNews>> getHeadLines() async {
    final data = await _apiService.fetchHeadlines(country: 'us', pageSize: 100);
    return data.map((model) => CardHeadlineNews(model)).toList();
  }


}