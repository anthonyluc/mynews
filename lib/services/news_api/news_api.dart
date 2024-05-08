import 'package:http/http.dart' as http;

String cat = "films";

final newsUrl =
    'https://newsapi.org/v2/everything?q=$cat&language=fr&sortBy=publishedAt&apiKey=c7d986faea5b4c9b8e2d65bf812cc792';

class NewsApi {
  static Future getArticles() async {
    return await http.get(Uri.parse(newsUrl));
  }
}
