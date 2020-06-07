import 'dart:convert';
import 'package:flutterregistro/models/Usuario.dart';
import 'package:http/http.dart' as http;

Future<http.Response> addUser(Usuario persona) async {
  Map jsonData = {'persona': persona};
  final response = await http.post("http://199.192.16.168:80/api/registro_usuario",
      headers: {
        "content-type": "application/json",
      },
      body: json.encode(jsonData));
  print(response.body);
  return response;
}


Future<http.Response> login(String correo, String pass) async {
  Map jsonData = {'correo': correo, 'password': pass, 'tipo_persona_id':2};

  final response = await http
      .post("http://199.192.16.168:80/api/login",
      headers: {
        "content-type": "application/json",
      },
      body: json.encode(jsonData));

  print(response.body);
  return response;
}



