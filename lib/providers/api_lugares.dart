import 'dart:convert';
import 'package:flutterregistro/preferences/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutterregistro/models/Lugares.dart';
import 'package:http/http.dart' as http;
import 'package:flutterregistro/models/Lugar.dart';

PreferenciasUsuario pref = PreferenciasUsuario();
/*
Future<List<Lugares>> getLugares() async{
  final response = await http.get("http://199.192.16.168/api/get_all_localidades");
  return aquiputoFromJson(response.body);
}
*/


Future<List<Lugar>> getLugar() async{
  Map jsonData = {'id':pref.id};
  final response = await http.post(
      "http://199.192.16.168:80/api/get_Lugares",
      headers: {
        "content-type": "application/json",
        "Authorization": "Bearer ${pref.token}",
        "Accept": "aplication.json"
      },
      body: json.encode(jsonData));
  print(response.body);
  return lugarFromJson(response.body);
}

Future<http.Response> addLugar(Lugar nuevo) async {

  Map agregar = {
    'descripcion': nuevo.descripcion,
    'latitud':nuevo.latitud,
    'longitud':nuevo.longitud,
    'persona_id':pref.id,
  };

  final response = await http.post('http://199.192.16.168:80/api/agregar_Lugar',
      headers: {
        "content-type": "application/json",
        "Authorization": "Bearer ${pref.token}",
        "Accept": "aplication/json"
      },
      body: json.encode(agregar));
  print(response.body);
  return response;
}

Future<http.Response> editarLugar(Lugar editar) async{
  final response = await http.post('http://199.192.16.168:80/api/actualizar_lugar',
      headers: {
        "content-type": "application/json",
        "Authorization": "Bearer ${pref.token}",
        "Accept": "aplication/json"
      },
      body:  lugarToJson(editar));
  return response;
}


Future<http.Response> eliminarLugar(Lugar borrar) async{
  final response = await http.post('http://199.192.16.168:80/api/eliminar_lugar',
      headers: {
        "content-type": "application/json",
        "Authorization": "Bearer ${pref.token}",
        "Accept": "aplication/json"
      },
      body:  lugarToJson(borrar));
  return response;
}

