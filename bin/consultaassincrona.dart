import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

Future<void> main() async {
  final url = Uri.parse('https://api.github.com/users/VictorSmaniotto');
  final response = await http.get(url);
  final data = jsonDecode(response.body);

  final createdAt = DateTime.parse(data['created_at']);
  final updatedAt = DateTime.parse(data['updated_at']);

  final formataData = DateFormat('dd/MM/yyyy HH:mm:ss');

  print("Usuário: ${data['login']}");
  print("Data de Criação: ${formataData.format(createdAt)}");
  print("Último acesso: ${formataData.format(updatedAt)}");
  // print("Teste: ${DateFormat('dd/MM/yyyy HH:mm:ss').format(DateTime.parse(data['created_at']))}"); -- EM uma linha
  print("Repositórios: ${data['repos_url']}");
}
