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
    return print(nomeRepos);
  }

  print("\nRepositório de ${response.data['login']}");
  repositorios();
}

void main() {
  request('VictorSmaniotto');
}
