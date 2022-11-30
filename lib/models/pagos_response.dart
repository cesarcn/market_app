import 'dart:convert';

import 'package:lab05/models/pagos.dart';

class PagosResponse {
  PagosResponse({
    required this.pagos,
  });

  List<Pago> pagos;

  factory PagosResponse.fromJson(String str) =>
      PagosResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PagosResponse.fromMap(Map<String, dynamic> json) => PagosResponse(
        pagos: List<Pago>.from(json["pagos"].map((x) => Pago.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "pagos": List<dynamic>.from(pagos.map((x) => x.toMap())),
      };
}
