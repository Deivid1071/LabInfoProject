
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:labinfoapp/model/user.dart';
import '../config.dart';

class ApiService {
  final String _baseUrl = environment['baseUrl'];
  Client client = Client();

  Future<UserResponse> authorize(String email, String password) async {
    try {
      final response = await client
          .post(
          Uri.parse("$_baseUrl/algumacoisa"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Accept' : 'application/json'
          },
          body: jsonEncode(<String, dynamic>{
            'email': email,
            'password': password,
          })
      ).timeout(const Duration(seconds: 10));

      switch (response.statusCode) {
        case 200:
          return UserResponse.fromJson(json.decode(response.body));
          break;
        case 400:
          return UserResponse.withError(json.decode(response.body));
          break;
        default:
          return UserResponse.withError(
              "${response.statusCode}: ${response.body}");
          break;
      }
    } on TimeoutException catch (e) {
      return UserResponse.withError("Timeout: $e");
    } catch (e) {
      return UserResponse.withError("ERROR: $e");
    }
  }

  Future<UserResponse> register(String email, String password, String titulo, String curso) async {
    try {
      final response = await client
          .post(
          Uri.parse("$_baseUrl/algumacoisa"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Accept' : 'application/json'
          },
          body: jsonEncode(<String, dynamic>{
            'email': email,
            'password': password,
            'titulo': titulo,
            'curso': curso,
          })
      ).timeout(const Duration(seconds: 10));

      switch (response.statusCode) {
        case 200:
          return UserResponse.fromJson(json.decode(response.body));
          break;
        case 400:
          return UserResponse.withError(json.decode(response.body));
          break;
        default:
          return UserResponse.withError(
              "${response.statusCode}: ${response.body}");
          break;
      }
    } on TimeoutException catch (e) {
      return UserResponse.withError("Timeout: $e");
    } catch (e) {
      return UserResponse.withError("ERROR: $e");
    }
  }


}