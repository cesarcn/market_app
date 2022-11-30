import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:lab05/models/inventario.dart';
import 'package:lab05/models/inventario_response.dart';

class InventarioProvider extends ChangeNotifier {
  String _baseUrl = '192.168.0.19:3999';

  List<Inventario> listaInventario = [];

  InventarioProvider() {
    print('Ingresando a ProductoProvider');
    this.getOnInventarioList();
  }

  getOnInventarioList() async {
    var url = Uri.http(_baseUrl, '/api/inventario', {});
    final response = await http.get(url);
    print(response.body);
    final inventarioResponse = InventarioResponse.fromJson(response.body);
    listaInventario = inventarioResponse.inventarios;
    notifyListeners();
  }

  saveInventario(Inventario inventario) async {
    var url = Uri.http(_baseUrl, '/api/inventario/save');
    print(inventario.toJson());
    final response = await http.post(url,
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: inventario.toJson());
    print(response.body);
    getOnInventarioList();
    notifyListeners();
  }
}
