import 'package:http/http.dart' as http;
import 'apikey.dart';

class NewsApi {
  static Future getArticles(String category) async {
    final newsUrl =
        'https://newsapi.org/v2/everything?q=$category&language=fr&sortBy=publishedAt&pageSize=10&apiKey=$apiKey';
    return await http.get(Uri.parse(newsUrl));
  }
}
