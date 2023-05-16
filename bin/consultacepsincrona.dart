import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'))
      .then((response) {
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print(data[1]);
    } else {
      print('Erro ao fazer requisição: ${response.statusCode}');
    }
  });
}
