import 'package:flutter/material.dart';
import 'package:lab05/models/pagos.dart';
import 'package:lab05/providers/pagos_provider.dart';
import 'package:lab05/widgets/menu_lateral.dart';

import 'package:provider/provider.dart';

class PagosScreen extends StatefulWidget {
  @override
  createState() => _PagosScreen();
}

class _PagosScreen extends State<PagosScreen> {
  @override
  Widget build(BuildContext context) {
    final pagosProvider = Provider.of<PagosProvider>(context);
    final List<Pago> listaPagos = pagosProvider.listaPagos;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Pagos'),
        backgroundColor: Color.fromARGB(255, 133, 9, 9),
      ),
      drawer: const MenuLateral(),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/background.jpg'), fit: BoxFit.cover),
        ),
        child: Center(
            child: ListView.builder(
          itemCount: listaPagos.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(listaPagos[index].NomUsuario),
              subtitle: Text(listaPagos[index].NumTarje),
              leading: CircleAvatar(
                child: Text(listaPagos[index].NomUsuario.substring(0, 1)),
                backgroundColor: Color.fromARGB(255, 133, 9, 9),
              ),
            );
          },
        )),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, 'ruta_pagos_form');
        },
        backgroundColor: Color.fromARGB(255, 133, 9, 9),
      ),
    );
  }
}
