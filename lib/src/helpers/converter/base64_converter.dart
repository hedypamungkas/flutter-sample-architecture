import 'dart:convert';
import 'dart:io';

class Base64Converter {
  static String convertBase64(String path) {
    File fileImage = new File(path);
    List<int> imageBytes = fileImage.readAsBytesSync();
    String result = base64Encode(imageBytes);
    return result;
  }
}