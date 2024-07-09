import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:sicherr/core/exceptions/exceptions.dart';
import 'package:http/http.dart' as http;

import '../../core/const/url.dart';
import '../../core/utils/phone_encryptor.dart';

class HttpClient {
  final FirebaseAuth auth;
  final PhoneNumberEncryptor encryptor;

  Future<void> startTimer({
    required DateTime executionDate,
    required String phone,
    required List<String> phones,
    required String warningTitle,
    required String warningMessage,
    required String triggerTitle,
    required String triggerMessage,
    required String sosMessage,
    required int seconds,
  }) async {
    try {
      final idToken = await auth.currentUser?.getIdToken();
      if (idToken == null) return;
      final userId = auth.currentUser!.uid;
      var headers = {
        'Authorization': 'Bearer $idToken',
        'Content-Type': 'application/json'
      };
      var body = {
        'executionDate': executionDate.toUtc().toIso8601String(),
        'userId': userId,
        'warning_title': warningTitle,
        'warning_message': warningMessage,
        'trigger_title': triggerTitle,
        'trigger_message': triggerMessage,
        'phones': phones.map((e) => encryptor.encrypt(e)).toList(),
        'phone': phone,
        'sos_message': sosMessage.isEmpty ? "SOS" : sosMessage,
        'seconds': seconds
      };

      var apiUrl = Uri.parse('$url$startTimerEndpoint');
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

  Future<void> stopTimer() async {
    try {
      final idToken = await auth.currentUser?.getIdToken();
      if (idToken == null) return;
      final userId = auth.currentUser!.uid;
      var headers = {
        'Authorization': 'Bearer $idToken',
        'Content-Type': 'application/json'
      };
      var body = {
        'userId': userId,
      };
      var apiUrl = Uri.parse('$url$stopTimerEndpoint');
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

  Future<void> sendNotification(
      {required String title,
      required String message,
      required List<String> phones,
      required Map<String,dynamic> data}) async {
    try {
      final idToken = await auth.currentUser?.getIdToken();
      if(phones.isEmpty) return;
      if (idToken == null) return;
      var headers = {
        'Authorization': 'Bearer $idToken',
        'Content-Type': 'application/json'
      };
      var body = {
        'title': title,
        'message': message,
        'phones': phones.map((e) => encryptor.encrypt(e)).toList(),
        'data': data
      };

      var apiUrl = Uri.parse('$url$sendNotificationEndpoint');
      var response =
          await http.post(apiUrl, headers: headers, body: jsonEncode(body));

      if (response.statusCode == 200) {
        print('send success');
      } else {
        throw Exception('Failed to send notification: ${response.statusCode}');
      }
    } on Exception catch (e) {
      throw BadRequestException(message: e.toString());
    }
  }

  Future<void> changePhoneNumber({required String newPhoneNumber}) async{
    try {
      final idToken = await auth.currentUser?.getIdToken();
      final userId = auth.currentUser?.uid;
      if(idToken == null || userId == null) return;
      var headers = {
        'Authorization': 'Bearer $idToken',
        'Content-Type': 'application/json'
      };
      var body = {
        'uid': userId,
        'phoneNumber': newPhoneNumber,
      };

      var apiUrl = Uri.parse('$url$changePhoneNumberEndpoint');
      var response =
      await http.post(apiUrl, headers: headers, body: jsonEncode(body));

      if (response.statusCode == 200) {
        print('send success');
      } else {
        throw Exception('Failed to send notification: ${response.statusCode}');
      }
    } on Exception catch (e) {
      throw BadRequestException(message: e.toString());
    }

  }

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
        'phone': encryptor.decrypt(currentUserPhone),
        'phones': emContactPhones.map((e) => encryptor.encrypt(e)).toList(),
      };

      print(jsonEncode(body));

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

  const HttpClient({required this.encryptor, required this.auth});
}
