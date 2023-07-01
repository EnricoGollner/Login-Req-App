import 'package:http/http.dart' as http;

abstract class IHttpClient {
  Future get({required String url});
}

class HttpClient implements IHttpClient {
  // Criamos uma instância do ClientHTTP e armazena dentro da variável client.
  final client = http.Client();

  @override
  Future get({required String url}) async {
    // client.get espera que passemos uma URI, então convertemos - operações HTTP são assíncronas -:
    return await client.get(Uri.parse(url));
  }
}
