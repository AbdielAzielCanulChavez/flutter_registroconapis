import 'dart:convert';


class Lugares{
  String id;
  String descripcion;

  Lugares({this.id, this.descripcion});

  factory Lugares.fromJson(Map<String, dynamic> json) => Lugares(
    id: ((json["id"]).toString() != null && (json["id"]).toString() != "")
        ? (json['id']).toString() : (json['id']).toString(),
    descripcion: json["descripcion"],
  );

  Map<String, dynamic>toJson()=>{
    "id":id,
    "descripcion":descripcion,
  };



}

List<Lugares> aquiputoFromJson(String strJson){
  final str = json.decode(strJson);
  return List<Lugares>.from(str.map((item){
    print(item);
    return Lugares.fromJson(item);
  }));
}

String lugaresToJson(Lugares lugares){
  final dyn = lugares.toJson();
  return json.encode(dyn);
}