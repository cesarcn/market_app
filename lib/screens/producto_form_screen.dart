import 'package:flutter/material.dart';
import 'package:lab05/models/producto.dart';
import 'package:lab05/providers/producto_provider.dart';
import 'package:provider/provider.dart';

class ProductoFormScreen extends StatefulWidget {
  const ProductoFormScreen({Key? key}) : super(key: key);

  @override
  State<ProductoFormScreen> createState() => _ProductoFormScreen();
}

enum Categorias { computo, sonido }

class _ProductoFormScreen extends State<ProductoFormScreen> {
  final _formKey = GlobalKey<FormState>();

  final txtDescripcion = TextEditingController();
  final txtPrecio = TextEditingController();
  final txtImagen = TextEditingController();
  Categorias? _catSeleccion = Categorias.computo;
  bool? _estadoActivo = false;

  @override
  Widget build(BuildContext context) {
    final productoProvider = Provider.of<ProductoProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('REGISTRO DE PRODUCTO'),
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
                  labelText: 'Descripcion',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0))),
              controller: txtDescripcion,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Por favor ingrese una descripcion';
                }
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Precio',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0))),
              controller: txtPrecio,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Por favor ingrese una descripcion';
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
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Validando...')));

                    var producto = Producto(
                        id: '',
                        productoId: 0,
                        descripcion: txtDescripcion.text,
                        precio: int.parse(txtPrecio.text),
                        imagen: txtImagen.text,
                        categoria: _catSeleccion.toString(),
                        estado: _estadoActivo.toString());

                    productoProvider.saveProducto(producto);

                    Navigator.pushReplacementNamed(context, 'ruta_productos');
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
