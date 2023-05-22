import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart' as intl;

String formataData(String data, {String formato = 'dd/MM/yyyy HH:mm'}) {
  final dataConversao = DateTime.parse(data);
  final formatoSaida = intl.DateFormat(formato);
  return formatoSaida.format(dataConversao);
}

Future main() async {
  var url = 'https://api.github.com/users/VictorSmaniotto';
  var headers = {
    'Authorization':
        'Bearer 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'
  };

  final response = await http.get(Uri.parse(url), headers: headers);

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    print('========================= Perfil =========================\r');
    print('Usuário: ${data['login']}');
    print('Data de Criação: ${formataData(data['created_at'])}');
    print('Data do Último acesso: ${formataData(data['updated_at'])}');
    print('Endpoint Repositórios: ${data['repos_url']}');

    final reposresponse = await http.get(Uri.parse(data['repos_url']));
    if (reposresponse.statusCode == 200) {
      final repos = jsonDecode(reposresponse.body);
      print('\n====================== Repositórios ======================\n');
      for (var repo in repos) {
        print("${repo['name']} -> ${repo['clone_url']}");
        print(
            '---------------------------------------------------------------------------------------\n');
      }
    } else {
      print('Erro ao fazer requisição: ${reposresponse.statusCode}');
    }
  } else {
    print('Erro ao fazer requisição: ${response.statusCode}');
  }
}
