import 'dart:convert';

import 'package:lab05/models/usuario.dart';

class UsuarioResponse {
  UsuarioResponse({
    required this.usuarios,
  });

  List<Usuario> usuarios;

  factory UsuarioResponse.fromJson(String str) =>
      UsuarioResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UsuarioResponse.fromMap(Map<String, dynamic> json) => UsuarioResponse(
        usuarios:
            List<Usuario>.from(json["usuarios"].map((x) => Usuario.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "usuarios": List<dynamic>.from(usuarios.map((x) => x.toMap())),
      };
}
