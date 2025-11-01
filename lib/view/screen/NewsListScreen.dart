import 'package:aplikasi_berita/view/widget/CardHeadlineNews.dart';
import 'package:flutter/material.dart';

import '../../data/controller/BeritaHeadLineController.dart';

class NewslistScreen extends StatefulWidget {

  NewslistScreen({super.key});

  @override
  State<NewslistScreen> createState() => _NewslistScreenState();
}

class _NewslistScreenState extends State<NewslistScreen> {

  late final BeritaHeadLineController _controller;

  _NewslistScreenState() : _controller = BeritaHeadLineController();


  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(onRefresh: () async {
      setState(() {});
    }, child: FutureBuilder<List<CardHeadlineNews>>(
        future: _controller.getHeadLines(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No headlines found'));
          } else {
            final cards = snapshot.data!;
            return ListView(children: cards);
          }
        }
    ));
  }
}
