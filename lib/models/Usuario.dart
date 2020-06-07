import 'dart:convert';

Usuario personaFromJson(String str) => Usuario.fromJson(json.decode(str));

String personaToJson(Usuario data) => json.encode(data.toJson());

class Usuario{
  String ap_paterno;
  String ap_materno;
  String nombre;
  String password;
  String telefono;
  int localidad_id = 1;
  int tipo_persona_id = 2;
  int estado_persona_id = 1;
  String correo;
  var contactos = [];
  bool sin_contactos = true;
  String imgPersona = "no-imagen.png";
  String sexo;
  int autenticacion_persona_id = 1;
  String alias;

  Usuario({ this.ap_paterno,this.ap_materno ,this.nombre, this.password, this.telefono, this.localidad_id
  , this.tipo_persona_id, this.estado_persona_id, this.correo, this.contactos, this.sin_contactos
  ,this.imgPersona, this.sexo, this.autenticacion_persona_id, this.alias});

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
    ap_paterno: json["ap_paterno"],
    ap_materno: json["ap_materno"],
    nombre: json["nombre"],
    password: json["password"],
    telefono: json["telefono"],
    localidad_id: json["localidad_id"],
    tipo_persona_id: json["tipo_persona_id"],
    estado_persona_id: json["estado_persona_id"],
    correo: json["correo"],
    contactos: json["contactos"],
    sin_contactos: json["sin_contactos"],
    imgPersona: json["imgPersona"],
    sexo: json["sexo"],
    autenticacion_persona_id: json["autenticacion_persona_id"],
    alias: json["alias"],
  );

  Map<String, dynamic> toJson()=>{
    "ap_paterno": ap_paterno,
    "ap_materno": ap_materno,
    "nombre": nombre,
    "password":password,
    "telefono":telefono,
    "localidad_id":localidad_id,
    "tipo_persona_id":tipo_persona_id,
    "estado_persona_id": estado_persona_id,
    "correo": correo,
    "contactos":contactos,
    "sin_contactos": sin_contactos,
    "imgPersona" :imgPersona,
    "sexo":sexo,
    "autenticacion_persona_id":autenticacion_persona_id,
    "alias":alias,
  };
}

List<Usuario> usuarioFromJson(String strJson){
  final str = json.decode(strJson);
  return List<Usuario>.from(str.map((item){
    print(item);
    return Usuario.fromJson(item);
  }));




}