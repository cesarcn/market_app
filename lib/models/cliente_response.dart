import 'dart:convert';

import 'cliente.dart';

class ClienteResponse {
    ClienteResponse({
        required this.clientes,
    });

    List<Cliente> clientes;

    factory ClienteResponse.fromJson(String str) => ClienteResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ClienteResponse.fromMap(Map<String, dynamic> json) => ClienteResponse(
        clientes: List<Cliente>.from(json["clientes"].map((x) => Cliente.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "clientes": List<dynamic>.from(clientes.map((x) => x.toMap())),
    };
}