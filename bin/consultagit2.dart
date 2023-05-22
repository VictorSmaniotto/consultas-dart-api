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
}
