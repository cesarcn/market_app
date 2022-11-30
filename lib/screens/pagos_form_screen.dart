import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:lab05/models/pagos.dart';
import 'package:lab05/providers/pagos_provider.dart';
import 'package:provider/provider.dart';

class PagosFormScreen extends StatefulWidget {
  const PagosFormScreen({Key? key}) : super(key: key);

  @override
  State<PagosFormScreen> createState() => _PagosFormScreen();
}

enum Categorias { particular, privado }

class _PagosFormScreen extends State<PagosFormScreen> {
  final _formKey = GlobalKey<FormState>();

  final txtNomUsuario = TextEditingController();
  final txtNumTarje = TextEditingController();
  final txtfecha = TextEditingController();
  final txtclave = TextEditingController();
  Categorias? _catSeleccion = Categorias.particular;
  bool? _estadoActivo = false;

  @override
  Widget build(BuildContext context) {
    final pagosProvider = Provider.of<PagosProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 133, 9, 9),
        title: const Text('REGISTRO DE PAGOS'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/background.jpg'), fit: BoxFit.cover),
        ),
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                  icon: const Icon(Icons.person, color: Colors.black),
                  hintText: '',
                  hintStyle: TextStyle(color: Colors.black),
                  labelText: 'Nombre y Apellido',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0))),
              controller: txtNomUsuario,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Por favor ingrese una descripcion';
                }
              },
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: [MaskedInputFormatter('#### #### #### ####')],
                decoration: InputDecoration(
                    icon: Icon(Icons.credit_card, color: Colors.black),
                    hintText: '',
                    hintStyle: TextStyle(color: Colors.black),
                    labelText: '0000 0000 0000 0000',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                controller: txtNumTarje,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor ingrese una descripcion';
                  }
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 150,
              child: TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: [MaskedInputFormatter('##/##')],
                decoration: InputDecoration(
                    icon: Icon(Icons.date_range_outlined, color: Colors.black),
                    labelText: '00/00',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                controller: txtfecha,
                validator: (value) {
                  if (value!.isEmpty) {
                    return ' ingrese su Fecha';
                  }
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 150,
              alignment: Alignment.centerLeft,
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    icon: Icon(Icons.confirmation_num_outlined,
                        color: Colors.black),
                    labelText: 'cvv',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                controller: txtclave,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'ingrese el cvv';
                  }
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: <Widget>[
                Text('Categoria:'),
                SizedBox(
                  width: 20,
                ),
                Radio(
                    activeColor: Color.fromARGB(255, 133, 9, 9),
                    value: Categorias.particular,
                    groupValue: _catSeleccion,
                    onChanged: (value) {
                      setState(() {
                        _catSeleccion = value as Categorias?;
                        print(_catSeleccion);
                      });
                    }),
                Text('Débito'),
                SizedBox(
                  width: 15,
                ),
                Radio(
                    activeColor: Color.fromARGB(255, 133, 9, 9),
                    value: Categorias.privado,
                    groupValue: _catSeleccion,
                    onChanged: (value) {
                      setState(() {
                        _catSeleccion = value as Categorias?;
                        print(_catSeleccion);
                      });
                    }),
                Text('Crédito'),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: ElevatedButton(
                child: const Text('PAGAR'),
                style: botonestilo,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Validando...'),
                      backgroundColor: Color.fromARGB(255, 133, 9, 9),
                    ));
                    var pagos = Pago(
                        id: '',
                        pagoId: 0,
                        NomUsuario: txtNomUsuario.text,
                        NumTarje: txtNumTarje.text,
                        fecha: txtfecha.text,
                        clave: int.parse(txtclave.text));

                    pagosProvider.savePagos(pagos);

                    Navigator.pushReplacementNamed(context, 'ruta_pagos');
                  }
                },
              ),
            )
          ]),
        ),
      ),
    );
  }

  final botonestilo = ElevatedButton.styleFrom(
    foregroundColor: Colors.white,
    backgroundColor: Color.fromARGB(255, 133, 9, 9),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    elevation: 10.0,
  );
}
