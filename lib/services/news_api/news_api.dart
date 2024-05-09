import 'package:http/http.dart' as http;
import '../../api_key.dart';

class NewsApi {
  static Future getArticles(String category) async {
    final newsUrl =
        'https://newsapi.org/v2/everything?q=$category&language=fr&sortBy=publishedAt&apiKey=$newsApiKey';
    return await http.get(Uri.parse(newsUrl));
  }
}
