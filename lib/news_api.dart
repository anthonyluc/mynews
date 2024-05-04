import 'package:http/http.dart' as http;

const newsUrl =
    'https://newsapi.org/v2/everything?q=tesla&from=2024-04-04&sortBy=publishedAt&apiKey=c7d986faea5b4c9b8e2d65bf812cc792';

class NewsApi {
  static Future getArticles() {
    return http.get(Uri.parse(newsUrl));
  }
}
