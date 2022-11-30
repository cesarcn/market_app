import 'dart:convert';

class UsuarioReport {
  UsuarioReport({
    required this.id,
    required this.count,
  });

  String id;
  int count;

  factory UsuarioReport.fromJson(String str) =>
      UsuarioReport.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UsuarioReport.fromMap(Map<String, dynamic> json) => UsuarioReport(
        id: json["_id"],
        count: json["count"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "count": count,
      };
}
