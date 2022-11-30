import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lab05/models/cliente.dart';
import 'package:http/http.dart' as http;
import 'package:lab05/models/cliente_response.dart';

class ClienteProvider extends ChangeNotifier {
  String _baseUrl = '192.168.0.19:3999';

  List<Cliente> listaClientes = [];

  ClienteProvider() {
    print('Ingresando a ClienteProvider');
    this.getOnClienteList();
  }

  getOnClienteList() async {
    var url = Uri.http(_baseUrl, '/api/clientes', {});
    final response = await http.get(url);
    print(response.body);
    final clienteResponse = ClienteResponse.fromJson(response.body);
    listaClientes = clienteResponse.clientes;
    notifyListeners();
  }

  saveCliente(Cliente cliente) async {
    var url = Uri.http(_baseUrl, '/api/clientes/save');
    print(cliente.toJson());
    final response = await http.post(url,
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: cliente.toJson());
    print(response.body);
    getOnClienteList();
    notifyListeners();
  }
}
