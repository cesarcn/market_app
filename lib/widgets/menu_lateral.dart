import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MenuLateral extends StatelessWidget {
  const MenuLateral({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromARGB(255, 228, 197, 197),
      child: ListView(
        children: <Widget>[
          const DrawerHeader(
            child: Text(""),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/logo.png'), fit: BoxFit.cover)),
          ),
          Divider(
            color: Colors.white,
          ),
          ListTile(
            iconColor: Colors.redAccent[600],
            leading: Icon(Icons.home),
            title: const Text('Principal'),
            hoverColor: Colors.redAccent[100],
            textColor: Colors.black,
            onTap: () {
              Navigator.pushNamed(context, 'ruta_principal');
            },
          ),
          ListTile(
            iconColor: Colors.redAccent[600],
            leading: Icon(Icons.article_outlined),
            title: const Text('Productos'),
            hoverColor: Colors.redAccent[100],
            textColor: Colors.black,
            onTap: () {
              Navigator.pushNamed(context, 'ruta_productos');
            },
          ),
          ListTile(
            iconColor: Colors.redAccent[600],
            leading: Icon(Icons.people_outlined),
            title: const Text('Clientes'),
            hoverColor: Colors.redAccent[100],
            textColor: Colors.black,
            onTap: () {
              Navigator.pushNamed(context, 'ruta_clientes');
            },
          ),
          ListTile(
            iconColor: Colors.redAccent[600],
            leading: Icon(Icons.shopping_cart_outlined),
            title: const Text(
              'Carrito de Compras', /* style: TextStyle(color: Colors.red), */
            ),
            hoverColor: Colors.redAccent[100],
            textColor: Colors.black,
            onTap: () {
              Navigator.pushNamed(context, 'ruta_carrito');
            },
          ),
          ListTile(
            iconColor: Colors.redAccent[600],
            leading: Icon(Icons.payment),
            title: const Text('Pagos'),
            hoverColor: Colors.redAccent[100],
            textColor: Colors.black,
            onTap: () {
              Navigator.pushNamed(context, 'ruta_pagos');
            },
          ),
          ListTile(
            iconColor: Colors.redAccent[600],
            leading: Icon(Icons.local_shipping_outlined),
            title: const Text('Proveedores'),
            hoverColor: Colors.redAccent[100],
            textColor: Colors.black,
            onTap: () {
              Navigator.pushNamed(context, 'ruta_proveedores');
            },
          ),
          ListTile(
            iconColor: Colors.redAccent[600],
            leading: Icon(Icons.inventory_2_outlined),
            title: const Text('Inventarios'),
            hoverColor: Colors.redAccent[100],
            textColor: Colors.black,
            onTap: () {
              Navigator.pushNamed(context, 'ruta_inventarios');
            },
          ),
          ListTile(
            iconColor: Colors.redAccent[600],
            leading: Icon(Icons.bar_chart),
            title: const Text('Reportes'),
            hoverColor: Colors.redAccent[100],
            textColor: Colors.black,
            onTap: () {
              Navigator.pushNamed(context, 'ruta_reporte');
            },
          ),
          ListTile(
            iconColor: Colors.redAccent[600],
            leading: Icon(Icons.co_present_outlined),
            title: const Text('Usuarios'),
            hoverColor: Colors.redAccent[100],
            textColor: Colors.black,
            onTap: () {
              Navigator.pushNamed(context, 'ruta_usuario');
            },
          ),
          Divider(
            color: Colors.white,
          ),
          ListTile(
            iconColor: Colors.redAccent[600],
            leading: Icon(Icons.logout),
            title: const Text('Cerrar Sesión'),
            hoverColor: Colors.redAccent[100],
            textColor: Colors.black,
            onTap: () {
              Navigator.pushNamed(context, 'ruta_splash');
            },
          ),
        ],
      ),
    );
  }
}
