import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lab05/models/producto.dart';
import 'package:lab05/providers/producto_provider.dart';
import 'package:lab05/widgets/menu_lateral.dart';
import 'package:provider/provider.dart';

class ProductoScreen extends StatefulWidget {
  @override
  createState() => _ProductoScreen();
}

class _ProductoScreen extends State<ProductoScreen> {
  @override
  Widget build(BuildContext context) {
    final productoProvider = Provider.of<ProductoProvider>(context);
    final List<Producto> listaProductos = productoProvider.listaProductos;

    return Scaffold(
      appBar: AppBar(
        title: Text('Productos'),
        backgroundColor: Color.fromARGB(255, 133, 9, 9),
      ),
      drawer: const MenuLateral(),
      body: Center(
          child: ListView.builder(
        itemCount: listaProductos.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Container(
                margin: EdgeInsets.only(top: 30, bottom: 20),
                width: double.infinity,
                height: 400,
                decoration: _cardBorders(),
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    //_ImagenFondo(),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Container(
                        width: double.infinity,
                        height: 400,
                        child: FadeInImage(
                            placeholder: AssetImage('assets/jar-loading.gif'),
                            //image: AssetImage('assets/cardbox.jpg'),
                            image: NetworkImage(listaProductos[index].imagen),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Container(
                      color: Color.fromARGB(255, 133, 9, 9),
                      child: ListTile(
                        title: Text(
                          listaProductos[index].descripcion,
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 194, 110, 110)),
                        ),
                        subtitle: Text(
                          'S/.' + listaProductos[index].precio.toString(),
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        leading: Icon(Icons.card_giftcard),
                      ),
                    )
                  ],
                )),
          );
        },
      )),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, 'ruta_productos_form');
        },
        backgroundColor: Color.fromARGB(255, 133, 9, 9),
      ),
    );
  }
}

class _ImagenFondo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        width: double.infinity,
        height: 400,
        child: FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'),
            image: AssetImage('assets/cardbox.jpg'),
            fit: BoxFit.cover),
      ),
    );
  }
}

BoxDecoration _cardBorders() => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(color: Colors.black12, offset: Offset(0, 7), blurRadius: 10)
        ]);
