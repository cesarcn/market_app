import 'dart:convert';

class Cliente {
    Cliente({
        required this.id,
        required this.clienteId,
        required this.nombApellido,
        required this.dni,
    });

    String id;
    int clienteId;
    String nombApellido;
    int dni;

    factory Cliente.fromJson(String str) => Cliente.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Cliente.fromMap(Map<String, dynamic> json) => Cliente(
        id: json["_id"],
        clienteId: json["clienteId"],
        nombApellido: json["nombApellido"],
        dni: json["dni"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "clienteId": clienteId,
        "nombApellido": nombApellido,
        "dni": dni,
    };
}