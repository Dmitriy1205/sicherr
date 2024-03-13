import 'dart:convert';

import 'package:sicherr/core/exceptions/exceptions.dart';
import 'package:http/http.dart' as http;

import '../../core/const/url.dart';

class HttpClient {
  Future<void> sendSos({
    required String idToken,
    required String? lat,
    required String? long,
    required String message,
    required String currentUserPhone,
    required List<String> emContactPhones,
  }) async {
    try {
      var headers = {
        'Authorization': 'Bearer $idToken',
        'Content-Type': 'application/json'
      };
      var body = {
        'lat': lat,
        'long': long,
        'message': message,
        'phone': currentUserPhone,
        'phones': emContactPhones,
      };

      var apiUrl = Uri.parse('$url$sosEndpoint');
      var response =
          await http.post(apiUrl, headers: headers, body: jsonEncode(body));

      if (response.statusCode == 200) {
        print('send success');
      } else {
        throw Exception('Failed to send SOS: ${response.statusCode}');
      }
    } on Exception catch (e) {
      throw BadRequestException(message: e.toString());
    }
  }
}
