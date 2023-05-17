import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'))
      .then((response) {
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print("========== POSTS ===========");
      for (var body in data) {
        print("userID: ${body['userId']}");
        print("ID: ${body['id']}");
        print("Title: ${body['title']}");
        print("Body: ${body['body']}");
        print("=========================");
      }
    } else {
      print('Erro ao fazer requisição: ${response.statusCode}');
    }
  });
}
