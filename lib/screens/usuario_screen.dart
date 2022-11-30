import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:lab05/models/usuario.dart';
import 'package:lab05/providers/usuario_provider.dart';
import 'package:lab05/search/usuario_search.dart';
import 'package:lab05/widgets/menu_lateral.dart';
import 'package:provider/provider.dart';

class UsuarioScreen extends StatefulWidget {
  @override
  createState() => _UsuarioScreen();
}

class _UsuarioScreen extends State<UsuarioScreen> {
  @override
  Widget build(BuildContext context) {
    final usuarioProvider = Provider.of<UsuarioProvider>(context);
    final List<Usuario> listaUsuarios = usuarioProvider.listaUsuarios;

    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Usuarios'),
        backgroundColor: Color.fromARGB(255, 133, 9, 9),
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                  context: context,
                  delegate: UsuarioSearchDelegate(listaUsuarios));
            },
          )
        ],
      ),
      drawer: const MenuLateral(),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/background.jpg'), fit: BoxFit.cover),
        ),
        width: double.infinity,
        // height: size.height * 0.7,
        child: Swiper(
          itemCount: listaUsuarios.length,
          layout: SwiperLayout.STACK,
          itemWidth: size.width * 0.8,
          itemHeight: size.height * 0.7,
          itemBuilder: (BuildContext context, int index) {
            return _cardUsuario(listaUsuarios[index]);
          },
        ),
      ),
    );
  }
}

class _cardUsuario extends StatelessWidget {
  final Usuario usuario;
  _cardUsuario(this.usuario);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 140, bottom: 20),
      width: double.infinity,
      height: size.height * 0.5,
      decoration: _cardBorders(),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [_ImagenFondo(usuario), _EtiquetaUsuario(usuario)],
      ),
    );
  }
}

class _ImagenFondo extends StatelessWidget {
  final Usuario usuario;
  _ImagenFondo(this.usuario);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        width: double.infinity,
        height: 400,
        child: const Image(
            image: AssetImage('assets/usuario.png'), fit: BoxFit.contain),
      ),
    );
  }
}

class _EtiquetaUsuario extends StatelessWidget {
  final Usuario usuario;
  _EtiquetaUsuario(this.usuario);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25)),
          color: Color.fromARGB(255, 133, 9, 9)),
      child: ListTile(
        title: Text(
          usuario.nombreA,
          style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 194, 110, 110)),
        ),
        subtitle: Text(
          usuario.correo,
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        trailing: IconButton(
          icon: const Icon(
            Icons.edit,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pushNamed(context, 'ruta_usuario_form',
                arguments: usuario);
          },
        ),
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
