import 'package:http/http.dart' as http;

class NewsApi {
  static Future getArticles(String category) async {
    final newsUrl =
        'https://newsapi.org/v2/everything?q=$category&language=fr&sortBy=publishedAt&pageSize=10&apiKey=c7d986faea5b4c9b8e2d65bf812cc792';
    return await http.get(Uri.parse(newsUrl));
  }
}
