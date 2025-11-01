import 'package:aplikasi_berita/data/model/BeritaHeadlineModel.dart';
import 'package:flutter/material.dart';

class CardHeadlineNews extends StatefulWidget {
  final BeritaHeadlineModel news;

  const CardHeadlineNews(this.news, {super.key});

  @override
  State<CardHeadlineNews> createState() => _CardHeadlineNewsState();
}

class _CardHeadlineNewsState extends State<CardHeadlineNews> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final news = widget.news;

    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Headline ---
            Text(
              news.title!,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),

            // --- Image (optional) ---
            if (news.urlToImage != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(news.urlToImage!, fit: BoxFit.cover),
              ),

            const SizedBox(height: 8),

            // --- Short description (always visible) ---
            Text(
              news.description ?? '',
              maxLines: _isExpanded ? null : 2,
              overflow: _isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyMedium,
            ),

            const SizedBox(height: 8),

            // --- Expand/Collapse button ---
            Align(
              alignment: Alignment.centerRight,
              child: TextButton.icon(
                icon: Icon(
                  _isExpanded ? Icons.expand_less : Icons.expand_more,
                  color: Theme.of(context).colorScheme.primary,
                ),
                label: Text(_isExpanded ? 'Hide' : 'Read more'),
                onPressed: () {
                  setState(() => _isExpanded = !_isExpanded);
                },
              ),
            ),

            // --- Optional: Full content preview if expanded ---
            if (_isExpanded && news.content != null)
              Text(
                news.content!,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.black87,
                ),
              ),
          ],
        ),
      ),
    );
  }
}