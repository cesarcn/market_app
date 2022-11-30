import 'dart:convert';

import 'package:lab05/models/inventario.dart';

class InventarioResponse {
  InventarioResponse({
    required this.inventarios,
  });

  List<Inventario> inventarios;

  factory InventarioResponse.fromJson(String str) =>
      InventarioResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory InventarioResponse.fromMap(Map<String, dynamic> json) =>
      InventarioResponse(
        inventarios: List<Inventario>.from(
            json["inventario"].map((x) => Inventario.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "inventario": List<dynamic>.from(inventarios.map((x) => x.toMap())),
      };
}
