import 'package:flutter/material.dart';
import 'package:lab05/models/cliente.dart';
import 'package:lab05/providers/cliente_provider.dart';
import 'package:provider/provider.dart';

class ClienteFormScreen extends StatefulWidget {
  const ClienteFormScreen({Key? key}) : super(key: key);

  @override
  State<ClienteFormScreen> createState() => _ClienteFormScreen();
}

enum Categorias { computo, sonido }

class _ClienteFormScreen extends State<ClienteFormScreen> {
  final _formKey = GlobalKey<FormState>();
  Categorias? _catSeleccion = Categorias.computo;
  bool? _estadoActivo = false;

  @override
  Widget build(BuildContext context) {
    final clienteProvider = Provider.of<ClienteProvider>(context);

    final txtNombApellido = TextEditingController();
    final txtDni = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('REGISTRO DE CLIENTE'),
        backgroundColor: Color.fromARGB(255, 133, 9, 9),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(children: <Widget>[
            TextFormField(
              //maxLines: 8,
              //maxLength: 50,
              decoration: InputDecoration(
                  labelText: 'NOMBRES Y APELLIDOS',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0))),
              controller: txtNombApellido,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Por favor ingrese un nombre y apellido';
                }
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'DNI',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0))),
              controller: txtDni,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Por favor ingrese un DNI';
                }
              },
            ),
            Container(
              child: ElevatedButton(
                child: const Text('GUARDAR'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Valindado...')));

                    var cliente = Cliente(
                        id: '',
                        clienteId: 0,
                        nombApellido: txtNombApellido.text,
                        dni: int.parse(txtDni.text));

                    clienteProvider.saveCliente(cliente);

                    Navigator.pushReplacementNamed(context, 'ruta_clientes');
                  }
                },
              ),
            )
          ]),
        ),
      ),
    );
  }
}
