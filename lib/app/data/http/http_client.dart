import 'package:http/http.dart' as http;

abstract class IHttpClient {
  Future get({required String url});
}

// implemeneta o contrato ou classe abstrada IHttpClient
class HttpClient implements IHttpClient {
//! cria uma instancia do pacote http
  final client = http.Client();

  @override
  Future get({required String url}) async {
    return await client.get(Uri.parse(url));
  }
}
