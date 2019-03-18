import 'dart:convert';

class JsonConverter {
  static parsedJson(String body) {
    return json.decode(body);
  }

  static String convertJson(dynamic body) {
    return json.encode(body);
  } 
}