import 'package:flutter/material.dart';
import 'package:lab05/models/usuario.dart';

class UsuarioSearchDelegate extends SearchDelegate<Usuario> {
  final List<Usuario> listaUsuarios;

  UsuarioSearchDelegate(this.listaUsuarios);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(
            Icons.clear,
            color: Colors.blueAccent,
          ),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: Colors.blueAccent,
      ),
      onPressed: () {
        close(
            context,
            Usuario(
                id: '',
                usuarioId: 0,
                nombreA: '',
                correo: '',
                password: 0,
                direccion: '',
                telefono: 0,
                categoria: '',
                estado: 'false'));
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final listaFiltrada = query.isEmpty
        ? listaUsuarios
        : listaUsuarios
            .where((usuario) =>
                usuario.nombreA.toLowerCase().contains(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemCount: listaFiltrada.length,
      itemBuilder: (BuildContext context, int index) {
        return _cardUsuario(listaFiltrada[index], context);
      },
    );
  }
}

Widget _cardUsuario(Usuario usuarioFiltrado, context) {
  return Card(
    child: Column(
      children: <Widget>[
        ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage('assets/usuario.png'),
          ),
          title: Text(usuarioFiltrado.nombreA),
          subtitle: Text(usuarioFiltrado.correo),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Navigator.pushNamed(context, 'ruta_usuario_form',
                arguments: usuarioFiltrado);
          },
        )
      ],
    ),
  );
}
