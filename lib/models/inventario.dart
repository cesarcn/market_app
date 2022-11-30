import 'dart:convert';
import 'dart:ffi';

class Inventario {
  Inventario({
    required this.inventarioId,
    required this.codproducto,
    required this.nomproducto,
    required this.imagen,
    required this.stock,
    required this.estado,
    required this.categoria,
  });

  String inventarioId;
  int codproducto;
  String nomproducto;
  String imagen;
  int stock;
  String categoria;
  String estado;

  factory Inventario.fromJson(String str) =>
      Inventario.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Inventario.fromMap(Map<String, dynamic> json) => Inventario(
        inventarioId: json["inventarioId"],
        codproducto: json["codproducto"],
        nomproducto: json["nomproducto"],
        imagen: json["imagen"],
        stock: json["stock"],
        estado: json["estado"],
        categoria: json["categoria"],
      );

  Map<String, dynamic> toMap() => {
        "inventarioId": inventarioId,
        "codproducto": codproducto,
        "nomproducto": nomproducto,
        "imagen": imagen,
        "stock": stock,
        "estado": estado,
        "categoria": categoria,
      };
}
