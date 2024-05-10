import "package:flutter/material.dart";
import "../../widgets/app_bar_widget.dart";
import "../../services/news_api/news_api.dart";
import 'package:url_launcher/url_launcher.dart';
import '../../models/article.dart';
import 'dart:convert';
import '../../theme/theme.dart';

class NewsPage extends StatefulWidget {
  final String category;
  const NewsPage({super.key, required this.category});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  var articles = <Article>[];

  void _getArticles(category) {
    NewsApi.getArticles(category).then((response) {
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
    _getArticles(widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: widget.category,
      ),
      body: ListView.builder(
          addAutomaticKeepAlives: false,
          addRepaintBoundaries: false,
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
      floatingActionButton: const ThemeButton(),
    );
  }
}
