import 'package:flutter/material.dart';
import 'package:lab05/models/usuario.dart';

class LoginScreen extends StatefulWidget {
  @override
  createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final txtUser = TextEditingController();
  final txtPass = TextEditingController();
/*   User user = User('', ''); */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Color.fromARGB(255, 133, 9, 9),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/background.jpg'), fit: BoxFit.cover),
        ),
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                //para un espacio de separacion
                height: 15.0,
              ),
              _userTextFormField(), //esto es como un metodo de manera privada, luego pasamos por encima para crear metodo
              SizedBox(
                height: 15.0,
              ),
              _passwordTextFormField(),
              SizedBox(
                height: 15.0,
              ),
              _bottonRecuperar(),
              SizedBox(
                height: 10.0,
              ),
              _bottonLogin(),
              SizedBox(
                height: 15.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _userTextFormField() {
    final txtUser = TextEditingController();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
            icon: Icon(Icons.person, color: Colors.black),
            hintText: 'Ingrese su correo',
            hintStyle: TextStyle(color: Colors.black),
            labelText: 'Correo',
            labelStyle: TextStyle(color: Colors.black)),
        controller: txtUser,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Por favor, ingrese su correo';
          } else if (RegExp(//Agregado
                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(value)) {
            return null;
          } else {
            return 'Por favor, ingrese un correo válido';
          } //Hasta Aca
        },
      ),
    );
  }

  Widget _passwordTextFormField() {
    final txtPass = TextEditingController();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        obscureText: true,
        decoration: const InputDecoration(
          icon: Icon(
            Icons.lock_outline,
            color: Colors.black,
          ),
          hintText: 'Ingrese su contraseña',
          hintStyle: TextStyle(color: Colors.black),
          labelText: 'Contraseña',
          labelStyle: TextStyle(color: Colors.black),
        ),
        controller: txtPass,
        validator: (value) {
          if (value!.length < 3) {
            return 'La contraseña debe tener mínimo 3 caracteres';
          } else {
            return null;
          }
        },
      ),
    );
  }

  _bottonRecuperar() {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return ElevatedButton(
/*           color: Colors.lightBlue[300], */
          child: const Text(
            '¿Olvidaste tu contraseña?',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          style: botonestilo,
          onPressed: () {},
        );
      },
    );
  }

  Widget _bottonLogin() {
    return StreamBuilder(
        //Este widget básicamente hace clickeable cualquier área.
        //Escucha los cambios en su respectivo objeto.
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      //use raisedbutton, ya que es el button por defecto que hay en android.
      return ElevatedButton(
          style: botonestilo,
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
            child: const Text(
              'Iniciar sesión',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              Navigator.pushReplacementNamed(context, 'ruta_principal');
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Ingresando...'),
                backgroundColor: Color.fromARGB(255, 133, 9, 9),
              ));
            }
          });
    });
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
