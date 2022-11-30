import 'dart:convert';

class Usuario {
  Usuario({
    required this.id,
    required this.usuarioId,
    required this.nombreA,
    required this.correo,
    required this.password,
    required this.direccion,
    required this.telefono,
    required this.categoria,
    required this.estado,
  });

  String id;
  int usuarioId;
  String nombreA;
  String correo;
  int password;
  String direccion;
  int telefono;
  String categoria;
  String estado;

  factory Usuario.fromJson(String str) => Usuario.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Usuario.fromMap(Map<String, dynamic> json) => Usuario(
        id: json["_id"],
        usuarioId: json["usuarioId"],
        nombreA: json["nombreA"],
        correo: json["correo"],
        password: json["password"],
        direccion: json["direccion"],
        telefono: json["telefono"],
        categoria: json["categoria"],
        estado: json["estado"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "usuarioId": usuarioId,
        "nombreA": nombreA,
        "correo": correo,
        "password": password,
        "direccion": direccion,
        "telefono": telefono,
        "categoria": categoria,
        "estado": estado,
      };
}

//Editado
/* class User {
  String correo;
  String password;
  User(this.correo, this.password);
} */
