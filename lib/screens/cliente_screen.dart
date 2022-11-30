import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lab05/models/cliente.dart';
import 'package:lab05/providers/cliente_provider.dart';
import 'package:lab05/widgets/menu_lateral.dart';
import 'package:provider/provider.dart';

class ClienteScreen extends StatefulWidget {
  @override
  createState() => _ClienteScreen();
}

class _ClienteScreen extends State<ClienteScreen> {
  @override
  Widget build(BuildContext context) {
    final clienteProvider = Provider.of<ClienteProvider>(context);
    final List<Cliente> listaClientes = clienteProvider.listaClientes;
    final PageController controller = PageController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Clientes'),
        backgroundColor: Color.fromARGB(255, 133, 9, 9),
      ),
      drawer: const MenuLateral(),
      body: PageView(
        scrollDirection: Axis.horizontal,
        children: listaClientes.map((Cliente item) {
          return Container(
              color: Colors.lightBlue,
              child: Center(
                child: Card(
                  child: Container(
                    height: 200,
                    margin: EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          leading: Icon(
                            Icons.person,
                            color: Colors.blueGrey,
                            size: 50,
                          ),
                          title: Text(
                            item.nombApellido,
                            style: TextStyle(
                                fontSize: 40.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueAccent),
                            textAlign: TextAlign.center,
                          ),
                          subtitle: Text(
                            item.dni.toString(),
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.red),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ));
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, 'ruta_clientes_form');
        },
        backgroundColor: Colors.blue,
      ),
    );
  }
}
