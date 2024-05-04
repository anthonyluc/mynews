import 'dart:convert';
import 'news_api.dart';
import 'models/article.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My News',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My News', style: TextStyle(color: Colors.white)),
          centerTitle: true,
          backgroundColor: Colors.blue,
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
      ),
    );
  }
}
