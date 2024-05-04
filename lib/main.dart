import 'dart:convert';
import 'news_api.dart';
import 'models/article.dart';
import 'package:flutter/material.dart';

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

  @override
  void initState() {
    super.initState();
    _getArticles();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My News',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My News'),
        ),
        body: ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context, index) {
              return Text(articles[index].title);
            }),
      ),
    );
  }
}
