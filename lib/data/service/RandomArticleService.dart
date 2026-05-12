import 'dart:convert';
import 'package:http/http.dart' as http;

class RandomArticleService {
  Future<Map<String, dynamic>> getRandomArticle() async {
    final uri = Uri.https(
      'en.wikipedia.org',
      '/api/rest_v1/page/random/summary',
    );

    final response = await http.get(uri);

    return jsonDecode(response.body) as Map<String, dynamic>;
  }
}