import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:lab05/models/usuario.dart';
import 'package:lab05/models/usuario_report.dart';
import 'package:lab05/models/usuario_report_response.dart';
import 'package:lab05/models/usuario_response.dart';

class UsuarioProvider extends ChangeNotifier {
  String _baseUrl = '192.168.0.19:3999';

  List<Usuario> listaUsuarios = [];
  List<UsuarioReport> listaUsuariosReport = [];

  UsuarioProvider() {
    print('Ingresando a UsuarioProvider');
    this.getOnUsuarioList();
    this.reporteUsuario(); // LLAMA A LA FUNCION QUE TRAE LOS USUARIOS REPORTADOS
  }

  getOnUsuarioList() async {
    var url = Uri.http(_baseUrl, '/api/usuarios', {});
    final response = await http.get(url);
    print(response.body);
    final usuarioResponse = UsuarioResponse.fromJson(response.body);
    listaUsuarios = usuarioResponse.usuarios;
    notifyListeners();
  }

  saveUsuario(Usuario usuario) async {
    var url = Uri.http(_baseUrl, '/api/usuarios/save');
    print(usuario.toJson());
    final response = await http.post(url,
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: usuario.toJson());
    print(response.body);
    getOnUsuarioList();
    reporteUsuario();
    notifyListeners();
  }

  reporteUsuario() async {
    var url = Uri.http(
        _baseUrl, 'api/reportes/usuariosReport'); // NOTIFICA A LOS LISTENERS
    final response = await http.get(url);
    final usuarioReportResponse =
        UsuarioReporteResponse.fromJson(response.body);
    listaUsuariosReport = usuarioReportResponse.usuarioReport;
    notifyListeners();
  }
}
