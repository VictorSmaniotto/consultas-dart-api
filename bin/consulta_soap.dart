import 'package:http/http.dart' as http;

void main() async {
  var headers = {
    'Content-Type': 'text/xml; charset=utf-8',
    'SOAPAction': 'http://tempuri.org/Multiply'
  };
  var request = http.Request(
      'POST', Uri.parse('http://www.dneonline.com/calculator.asmx'));
  request.body =
      '''<?xml version="1.0" encoding="utf-8"?>\n<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">\n  <soap:Body>\n    <Multiply xmlns="http://tempuri.org/">\n      <intA>10</intA>\n      <intB>20</intB>\n    </Multiply>\n  </soap:Body>\n</soap:Envelope>''';
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  } else {
    print(response.reasonPhrase);
  }
}
