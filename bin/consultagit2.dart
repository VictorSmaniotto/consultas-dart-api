<<<<<<< HEAD
import 'package:dio/dio.dart';

final dio = Dio();

void request(String user) async {
  Response response;
  response = await dio.get('https://api.github.com/users/$user');

  repositorios() async {
    Response repos = await dio.get(response.data['repos_url']);

    final List<dynamic> repositorios = repos.data;
    final nomeRepos =
        repositorios.map((repo) => repo['name'].toString()).toList();
    final urlRepos =
        repositorios.map((repo) => repo['clone_url'].toString()).toList();

    return print("Repositórios: $nomeRepos \n\n URL: $urlRepos");
  }

  print("\nRepositório de ${response.data['login']}");
  repositorios();
}

void main() {
  request('VictorSmaniotto');
=======
import 'dart:convert';

import 'package:http/http.dart' as http;

Future<void> main() async {
  var headers = {
    'Authorization':
        'Bearer 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'
  };
  var request = http.Request(
      'GET', Uri.parse('https://api.github.com/users/VictorSmaniotto'));

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    // print(await response.stream.bytesToString());
    final dataJson = await response.stream.bytesToString();
    final data = jsonDecode(dataJson);
    print("Usuário: ${data['login']}");
  } else {
    print(response.reasonPhrase);
  }
>>>>>>> bf19860f428fb0400d913f37bb1bd0655db212c4
}
