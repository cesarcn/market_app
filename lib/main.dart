import 'package:flutter/material.dart';
import 'package:lab05/providers/cliente_provider.dart';
import 'package:lab05/providers/inventario_provider.dart';
import 'package:lab05/providers/pagos_provider.dart';
import 'package:lab05/providers/producto_provider.dart';
import 'package:lab05/providers/usuario_provider.dart';
import 'package:lab05/screens/cliente_form_screen.dart';
import 'package:lab05/screens/cliente_screen.dart';
import 'package:lab05/screens/inventario_form_screen.dart';
import 'package:lab05/screens/inventario_screen.dart';
import 'package:lab05/screens/login_screen.dart';
import 'package:lab05/screens/pagos_form_screen.dart';
import 'package:lab05/screens/pagos_screen.dart';
import 'package:lab05/screens/principal_screen.dart';
import 'package:lab05/screens/producto_form_screen.dart';
import 'package:lab05/screens/producto_screen.dart';
import 'package:lab05/screens/proveedores_screen.dart';
import 'package:lab05/screens/registro_form_screen.dart';
import 'package:lab05/screens/reporte_screen.dart';
import 'package:lab05/screens/usuario_editar_screen.dart';
import 'package:lab05/screens/usuario_screen.dart';
import 'package:lab05/screens/welcome.dart';
import 'package:lab05/widgets/welcome_wid.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductoProvider(), lazy: false),
        ChangeNotifierProvider(create: (_) => ClienteProvider(), lazy: false),
        ChangeNotifierProvider(
            create: (_) => InventarioProvider(), lazy: false),
        ChangeNotifierProvider(create: (_) => UsuarioProvider(), lazy: false),
        ChangeNotifierProvider(create: (_) => PagosProvider(), lazy: false),
        ChangeNotifierProvider(
            create: (_) => InventarioProvider(), lazy: false),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'POS APP',
        home: SplashPage(
          duration: 3,
          goToPage: WelcomeScreen(),
        ),
        initialRoute: 'ruta_splash', // POR DEFECTO LLAMA A LA RUTA SPLASH
        routes: {
          'ruta_splash': (_) => SplashPage(
                duration: 3,
                goToPage: WelcomeScreen(),
              ),
          'ruta_login': (_) => LoginScreen(), // INTEGRANTE 1
          'ruta_registro_form': (_) => RegistroFormScreen(),
          'ruta_principal': (_) => PrincipalScreen(), // INTEGRANTE 2
          'ruta_productos': (_) => ProductoScreen(), // INTEGRANTE 3
          'ruta_productos_form': (_) => ProductoFormScreen(), // INTEGRANTE 3
          'ruta_pagos': (_) => PagosScreen(),
          'ruta_pagos_form': (_) => PagosFormScreen(),
          'ruta_proveedores': (_) => ProveedoresScreen(),
          'ruta_clientes': (_) => ClienteScreen(), // INTEGRANTE 4
          'ruta_clientes_form': (_) => ClienteFormScreen(), // INTEGRANTE 4
          'ruta_inventarios': (_) => InventarioScreen(),
          'ruta_inventario_form': (_) => InventarioFormScreen(),
          'ruta_reporte': (_) => ReportScreen(),
          'ruta_usuario': (_) => UsuarioScreen(),
          'ruta_usuario_form': (_) => UsuarioFormScreen(),
        },
      ),
    );
  }
}
