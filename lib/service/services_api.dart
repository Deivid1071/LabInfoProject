
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:labinfoapp/model/banca.dart';
import 'package:labinfoapp/model/user.dart';
import '../config.dart';

class ApiService {
  final String _baseUrl = environment['baseUrl'];
  Client client = Client();

  Future<UserResponse> authorize(String email, String password) async {
    try {
      final response = await client
          .post(
          Uri.parse("$_baseUrl/login"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Accept' : 'application/json'
          },
          body: jsonEncode(<String, dynamic>{
            'email': email,
            'password': password,
          })
      ).timeout(const Duration(seconds: 10));

      //print(json.decode(response.body));
      switch (response.statusCode) {
        case 200:
          return UserResponse.fromJson(json.decode(response.body)[0]);
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

  Future register(String email, String password, String titulo, String nome) async {
    print(password);
    try {
      final response = await client
          .post(
          Uri.parse("$_baseUrl/teacher"),
          headers: <String, String>{
            'content-type': 'application/x-www-form-urlencoded',
            'Accept' : 'application/json'
          },
          body: jsonEncode(<String, dynamic>{
            'email': email,
            'name': nome,
            'password': password,
            'title': titulo,
          })
      ).timeout(const Duration(seconds: 10));
      print(json.decode(response.body));
      print(response.statusCode);
      switch (response.statusCode) {
        case 200:
          return 200;
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


  Future getProjetos() async {
    List<Banca> bancas;
    try {
      final response = await client
          .get(
          Uri.parse("$_baseUrl/projects"),
          headers: <String, String>{
            'content-type': 'application/x-www-form-urlencoded',
            'Accept' : 'application/json'
          },
      ).timeout(const Duration(seconds: 10));
      switch (response.statusCode) {
        case 200:
          //print(jsonDecode(response.body));
          final List decodedJson = jsonDecode(response.body);
          final List<Banca> bancas = List();

          if (decodedJson.isNotEmpty) {
            decodedJson
                .forEach((banca) => bancas.add(Banca.fromJson(banca)));
          }
          return bancas;
          break;
        case 400:
          return json.decode(response.body);
          break;
        default:
          return (
              "${response.statusCode}: ${response.body}");
          break;
      }
    } on TimeoutException catch (e) {
      return "Timeout: $e";
    } catch (e) {
      return "ERROR: $e";
    }
  }

  Future createProjetos(String nome, String data, String nomeOrientador, String hora, List membros) async {
    try {
      final response = await client
          .post(
          Uri.parse("$_baseUrl/presentation"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Accept' : 'application/json'
          },
          body: jsonEncode(<String, dynamic>{
            'title': nome,
            'data': data,
            'orientador': nomeOrientador,
            'possuiCertificado': true,
            'hora': hora,
            'membros': membros,
          })
      ).timeout(const Duration(seconds: 10));

      print(response.statusCode);
      switch (response.statusCode) {
        case 200:

          return 200;
          break;
        case 400:
          return json.decode(response.body);
          break;
        default:
          return (
              "${response.statusCode}: ${response.body}");
          break;
      }
    } on TimeoutException catch (e) {
      return "Timeout: $e";
    } catch (e) {
      return "ERROR: $e";
    }
  }

  Future getProfessores() async {
    try {
      final response = await client
          .get(
          Uri.parse("$_baseUrl/teacher"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Accept' : 'application/json'
          },
      ).timeout(const Duration(seconds: 10));

      print(response.statusCode);
      switch (response.statusCode) {
        case 200:
          //print(jsonDecode(response.body));
          final List decodedJson = jsonDecode(response.body);
          final List<Professor> professores = List();

          if (decodedJson.isNotEmpty) {
            decodedJson
                .forEach((professor) => professores.add(Professor.fromJson(professor)));
          }
          return professores;
          break;
        case 400:
          return json.decode(response.body);
          break;
        default:
          return (
              "${response.statusCode}: ${response.body}");
          break;
      }
    } on TimeoutException catch (e) {
      return "Timeout: $e";
    } catch (e) {
      return "ERROR: $e";
    }
  }

  Future getMinhasBancas(int userId) async {
    List<Banca> minhasBancas;
    try {
      final response = await client
          .get(
        Uri.parse("$_baseUrl/presentation/$userId"),
        headers: <String, String>{
          'content-type': 'application/x-www-form-urlencoded',
          'Accept' : 'application/json'
        },
      ).timeout(const Duration(seconds: 10));
      switch (response.statusCode) {
        case 200:
        //print(jsonDecode(response.body));
          final List decodedJson = jsonDecode(response.body);
          final List<MinhaBanca> bancas = List();

          if (decodedJson.isNotEmpty) {
            decodedJson
                .forEach((minhaBanca) => bancas.add(MinhaBanca.fromJson(minhaBanca)));
          }
          return bancas;
          break;
        case 400:
          return "Deu erro";
          break;
        default:
          return (
              "${response.statusCode}: ${response.body}");
          break;
      }
    } on TimeoutException catch (e) {
      return "Timeout: $e";
    } catch (e) {
      return "ERROR: $e";
    }
  }


}

class Professor {
   String nome;
   int id;

  Professor(this.nome, this.id);

  Professor.fromJson(Map<String, dynamic> json){
    nome = json['name'];
    id = json['id'];
  }

}

class MinhaBanca {
  String titulo;
  String orientador;
  int possuiCertificado;
  String hora;
  String data;

  MinhaBanca(this.titulo, this.data,this.possuiCertificado, this.hora,this.orientador);

  MinhaBanca.fromJson(Map<String, dynamic> json){
    titulo = json['title'];
    data = json['data'];
    possuiCertificado = json['possuiCertificado'];
    hora = json['hora'];
    orientador = json['orientador'];
  }

}