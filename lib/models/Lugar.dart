import 'dart:convert';
import 'dart:ffi';

class Lugar{
  int id;
  String descripcion;
  double latitud;
  double longitud;
  int persona_id;

  Lugar({this.id, this.descripcion, this.latitud, this.longitud, this.persona_id});

  factory Lugar.fromJson(Map<String, dynamic> json) => Lugar(
    id: json["id"],
    descripcion: json["descripcion"],
    latitud : json['latitud'],
    longitud : json['longitud'],
    persona_id: json['persona_id'],
  );

  Map<String, dynamic>toJson()=>{
    "id_Lugar":id,
    "descripcion":descripcion,
    "latitud": latitud,
    "longitud":longitud,
    "id": persona_id,
  };

}
List<Lugar> lugarFromJson(String strJson){
  final str = json.decode(strJson);
  return List<Lugar>.from(str.map((item){
    print(item);
    return Lugar.fromJson(item);
  }));
}

String lugarToJson(Lugar lugar){
  final dyn = lugar.toJson();
  return json.encode(dyn);
}