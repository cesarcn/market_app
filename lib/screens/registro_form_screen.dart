import 'package:flutter/material.dart';
import 'package:lab05/models/usuario.dart';
import 'package:lab05/providers/usuario_provider.dart';
import 'package:provider/provider.dart';

class RegistroFormScreen extends StatefulWidget {
  const RegistroFormScreen({Key? key}) : super(key: key);

  @override
  createState() => _RegistroFormScreen();
}

enum Categorias { particular, privado }

class _RegistroFormScreen extends State<RegistroFormScreen> {
  final _formKey = GlobalKey<FormState>();

  final txtNombres = TextEditingController();
  final txtCorreo = TextEditingController();
  final txtPassword = TextEditingController();
  final txtDireccion = TextEditingController();
  final txtTelefono = TextEditingController();
  Categorias? _catSeleccion = Categorias.particular;
  bool? _estadoActivo = false;

  @override
  Widget build(BuildContext context) {
    final usuarioProvider = Provider.of<UsuarioProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('REGISTRO DE USUARIO'),
        backgroundColor: Color.fromARGB(255, 133, 9, 9),
      ),
      body: SingleChildScrollView(
        child: Container(
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
                    icon: Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                    hintText: '',
                    hintStyle: TextStyle(color: Colors.black),
                    labelText: 'Nombres y Apellidos',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                controller: txtNombres,
                validator: (value) {
                  if (value!.isEmpty) {
                    return '* Por favor ingrese su nombre';
                  }
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.email,
                      color: Colors.black,
                    ),
                    hintText: '',
                    hintStyle: TextStyle(color: Colors.black),
                    labelText: 'Correo electronico',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                controller: txtCorreo,
                validator: (value) {
                  if (value!.isEmpty) {
                    return '* Por favor ingrese sus apellidos';
                  }
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                obscureText: true,
                decoration: InputDecoration(
                    icon: Icon(Icons.lock_outline, color: Colors.black),
                    hintText: '',
                    hintStyle: TextStyle(color: Colors.black),
                    labelText: 'Contraseña',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                controller: txtPassword,
                validator: (value) {
                  if (value!.isEmpty) {
                    return '* Por favor ingrese una contraseña';
                  }
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                decoration: InputDecoration(
                    icon: Icon(Icons.home, color: Colors.black),
                    hintText: '',
                    hintStyle: TextStyle(color: Colors.black),
                    labelText: 'Direccion',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                controller: txtDireccion,
                validator: (value) {
                  if (value!.isEmpty) {
                    return '* Por favor ingrese su direccion';
                  }
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                decoration: InputDecoration(
                    icon: Icon(Icons.phone, color: Colors.black),
                    hintText: '',
                    hintStyle: TextStyle(color: Colors.black),
                    labelText: 'Celular',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                controller: txtTelefono,
                validator: (value) {
                  if (value!.isEmpty) {
                    return '* Por favor ingrese su celular';
                  }
                },
              ),
              SizedBox(height: 10.0),
              Row(
                children: <Widget>[
                  Text('Categoria:'),
                  SizedBox(
                    width: 20,
                  ),
                  Radio(
                      value: Categorias.particular,
                      activeColor: Color.fromARGB(255, 133, 9, 9),
                      groupValue: _catSeleccion,
                      onChanged: (value) {
                        setState(() {
                          _catSeleccion = value as Categorias?;
                          print(_catSeleccion);
                        });
                      }),
                  Text('Particular'),
                  SizedBox(
                    width: 15,
                  ),
                  Radio(
                      value: Categorias.privado,
                      activeColor: Color.fromARGB(255, 133, 9, 9),
                      groupValue: _catSeleccion,
                      onChanged: (value) {
                        setState(() {
                          _catSeleccion = value as Categorias?;
                          print(_catSeleccion);
                        });
                      }),
                  Text('Privado'),
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
                      activeColor: Color.fromARGB(255, 133, 9, 9),
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
              SizedBox(
                height: 10.0,
              ),
              ElevatedButton(
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 85.0, vertical: 15.0),
                  child: Text(
                    'Registrarse',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                style: botonestilo,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Regresando a Login...'),
                      backgroundColor: Color.fromARGB(255, 133, 9, 9),
                    ));

                    var usuario = Usuario(
                        id: '',
                        usuarioId: 0,
                        nombreA: txtNombres.text,
                        correo: txtCorreo.text,
                        password: int.parse(txtPassword.text),
                        direccion: txtDireccion.text,
                        telefono: int.parse(txtTelefono.text),
                        categoria: _catSeleccion.toString(),
                        estado: _estadoActivo.toString());
                    usuarioProvider.saveUsuario(usuario);

                    Navigator.pushReplacementNamed(context, 'ruta_login');
                  }
                },
              )
            ]),
          ),
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
