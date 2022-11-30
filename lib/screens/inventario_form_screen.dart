import 'package:flutter/material.dart';
import 'package:lab05/models/inventario.dart';
import 'package:lab05/providers/inventario_provider.dart';
import 'package:provider/provider.dart';

class InventarioFormScreen extends StatefulWidget {
  const InventarioFormScreen({Key? key}) : super(key: key);

  @override
  State<InventarioFormScreen> createState() => _InventarioFormScreen();
}

enum Categorias { computo, sonido }

class _InventarioFormScreen extends State<InventarioFormScreen> {
  final _formKey = GlobalKey<FormState>();

  final txtNomproducto = TextEditingController();
  final txtImagen = TextEditingController();
  final txtStock = TextEditingController();
  Categorias? _catSeleccion = Categorias.computo;
  bool? _estadoActivo = false;

  @override
  Widget build(BuildContext context) {
    final inventarioProvider = Provider.of<InventarioProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('REGISTRO DE INVENTARIO'),
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
                  labelText: 'Nombre del inventario',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0))),
              controller: txtNomproducto,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Por favor ingrese un nombre';
                }
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Stock',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0))),
              controller: txtStock,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Por favor ingrese el stock';
                }
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Imagen',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0))),
              controller: txtImagen,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Por favor ingrese una imagen';
                }
              },
            ),
            Row(
              children: <Widget>[
                Text('Categoria'),
                SizedBox(
                  width: 20,
                ),
                Radio(
                    value: Categorias.computo,
                    groupValue: _catSeleccion,
                    onChanged: (value) {
                      setState(() {
                        _catSeleccion = value as Categorias?;
                        print(_catSeleccion);
                      });
                    }),
                Text('Computo'),
                SizedBox(
                  width: 15,
                ),
                Radio(
                    value: Categorias.sonido,
                    groupValue: _catSeleccion,
                    onChanged: (value) {
                      setState(() {
                        _catSeleccion = value as Categorias?;
                        print(_catSeleccion);
                      });
                    }),
                Text('Sonido'),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: <Widget>[
                Text('Estado'),
                SizedBox(
                  width: 20,
                ),
                Checkbox(
                    value: _estadoActivo,
                    onChanged: (value) {
                      setState(() {
                        _estadoActivo = value;
                        print('_estadoActivo: ${_estadoActivo}');
                      });
                    }),
                Text('Activo')
              ],
            ),
            Container(
              child: ElevatedButton(
                child: const Text('GUARDAR'),
                style: botonestilo,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Validando...')));

                    var inventario = Inventario(
                        inventarioId: '',
                        codproducto: 0,
                        nomproducto: txtNomproducto.text,
                        stock: int.parse(txtStock.text),
                        imagen: txtImagen.text,
                        categoria: _catSeleccion.toString(),
                        estado: _estadoActivo.toString());

                    inventarioProvider.saveInventario(inventario);

                    Navigator.pushReplacementNamed(context, 'ruta_inventarios');
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
