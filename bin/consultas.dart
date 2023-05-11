import 'package:http/http.dart' as http;
import 'dart:convert';

void main() async {
  final posts = await fetchPosts();
  print(posts);
}

Future<List<dynamic>> fetchPosts() async {
  final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final List<dynamic> posts = json.decode(response.body);
    return posts;
  } else {
    throw Exception('Falha ao carregar os posts');
  }
}
