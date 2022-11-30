import 'dart:convert';

class Pago {
    Pago({
        required this.id,
        required this.pagoId,
        required this.NomUsuario,
        required this.NumTarje,
        required this.fecha,
        required this.clave,
    });

    String id;
    int pagoId;
    String NomUsuario;
    String NumTarje;
    String fecha;
    int clave;

    factory Pago.fromJson(String str) => Pago.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Pago.fromMap(Map<String, dynamic> json) => Pago(
        id: json["_id"],
        pagoId: json["pagoId"],
        NomUsuario: json["NomUsuario"],
        NumTarje: json["NumTarje"],
        fecha: json["Fecha"],
        clave: json["Clave"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "pagoId": pagoId,
        "NomUsuario": NomUsuario,
        "NumTarje": NumTarje,
        "Fecha": fecha,
        "Clave": clave,
    };
}
