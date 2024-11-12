import 'package:translate_app/models/translate_model.dart';
import 'package:translate_app/models/translate_result.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  final String apiUrl = "https://kamus.halohrev.com";

  Future<TranslateResult> fetchTranslate(
      TranslateModel langTranslate, String text) async {
    final response = await http.get(Uri.parse(apiUrl).replace(
      queryParameters: {
        "from": langTranslate.from.toLowerCase(),
        "to": langTranslate.to.toLowerCase(),
        "text": text
      },
    ));
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      return TranslateResult.fromJson(jsonData);
    } else {
      throw Exception("Failed to load translate");
    }
  }
}
