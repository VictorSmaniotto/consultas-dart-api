import 'package:dio/dio.dart';

final dio = Dio();
var headers = {
  'Authorization':
      'Bearer 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'
};
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
