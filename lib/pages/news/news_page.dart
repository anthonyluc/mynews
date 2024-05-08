import "package:flutter/material.dart";
import "../../widgets/app_bar_widget.dart";
import "../../services/news_api/news_api.dart";
import 'package:url_launcher/url_launcher.dart';
import '../../models/article.dart';
import 'dart:convert';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  var articles = <Article>[];

  void _getArticles() {
    NewsApi.getArticles().then((response) {
      setState(() {
        Iterable list = json.decode(response.body)['articles'];
        articles = list.map((model) => Article.fromJson(model)).toList();
      });
    });
  }

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  void initState() {
    super.initState();
    _getArticles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: 'News page',
      ),
      body: ListView.builder(
          itemCount: articles.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                _launchUrl(articles[index].url);
              },
              title: Text(articles[index].title),
              subtitle: Text(
                  '${articles[index].source} - ${articles[index].publishedAt}'),
              leading: Container(
                height: 60,
                width: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(articles[index].urlToImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          }),
    );
  }
}
