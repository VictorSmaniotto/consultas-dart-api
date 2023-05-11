import 'package:dio/dio.dart';

final dio = Dio();

void request(String cep) async {
  Response response;
  response = await dio.get('https://viacep.com.br/ws/$cep/json/');
  print(response.data.toString());

  if (response.statusCode != 200) {
    print(
        'Erro na requisição: ${response.statusCode} -> ${response.statusMessage}');
  }

  print("\n====== Endereço =====");
  print("CEP: ${response.data['cep']}");
  print("Logradouro: ${response.data['logradouro']}");
  print("Bairro: ${response.data['bairro']}");
  print("Cidade: ${response.data['localidade']} - ${response.data['uf']}\n");
}

void main() {
  request('17512813');
}
