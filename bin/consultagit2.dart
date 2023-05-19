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
}
