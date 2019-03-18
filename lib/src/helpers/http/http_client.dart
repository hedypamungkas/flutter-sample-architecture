import 'http_request.dart';
import 'package:http/http.dart' show Client;
import '../converter/utils_converter.dart' show JsonConverter;
export 'http_request.dart';

class HTTPClient {
  Client client = Client();
  final _baseUrl = "https://jsonplaceholder.typicode.com";
  final _timeout = Duration(seconds: 60);

  String _build(HTTPRequest request) {
    // final url = "$_baseUrl/${request.version}${request.path}";
    final url = "$_baseUrl${request.path}";
    return url;
  }

  _onTimeoutHandler() {
    print('_onTimeoutHandler');
    client.close();
  }
  
  Future _get(HTTPRequest request) async {
    final response = await client.get(_build(request), headers: _setDefaultHeaders())
                                  .timeout(_timeout, onTimeout: () => _onTimeoutHandler());
    return response;
  }

  Future _post(HTTPRequest request, dynamic parameters) async {
    final response = await client.post(_build(request), body: parameters, headers: _setDefaultHeaders())
                                  .timeout(_timeout, onTimeout: () => _onTimeoutHandler());
    return response;
  }

  Map<String, String> _setDefaultHeaders() {
    final header = {
      'accept': 'application/json',
      'content-type': 'application/json'
    };
    return header;
  }

  Future send(HTTPRequest request, {dynamic parameters}) async {
    if (request.method == HTTPMethod.GET) {
      final client = await _get(request);
      return _result(client);
    } else {
      final client = await _post(request, parameters);
      return _result(client);
    }
  }

  _result(dynamic response) {
    if (response != null) {
      return JsonConverter.parsedJson(response.body);
    }
    return response;
  }
}
