import 'package:http/http.dart' as http;
import 'package:taskkk/model/article_model.dart';

class ApiRepo {
  Future<List<ArticleModel>> fetchData() async {
    var response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
    );
    if (response.statusCode == 200) {
      return articleModelFromJson(response.body);
    } else {
      throw Exception('Network Error');
    }
  }
}
