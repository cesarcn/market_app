import 'dart:convert';

import 'package:lab05/models/usuario_report.dart';

class UsuarioReporteResponse {
  UsuarioReporteResponse({
    required this.usuarioReport,
  });

  List<UsuarioReport> usuarioReport;

  factory UsuarioReporteResponse.fromJson(String str) =>
      UsuarioReporteResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UsuarioReporteResponse.fromMap(Map<String, dynamic> json) =>
      UsuarioReporteResponse(
        usuarioReport: List<UsuarioReport>.from(
            json["usuarioReport"].map((x) => UsuarioReport.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "usuarioReport":
            List<dynamic>.from(usuarioReport.map((x) => x.toMap())),
      };
}
