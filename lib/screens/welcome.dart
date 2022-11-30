import 'package:flutter/material.dart';
import 'package:lab05/helpers/iconhelper.dart';
import 'package:lab05/widgets/iconfont.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  createState() => _WelcomeScreen();
}

class _WelcomeScreen extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.black,
          child: Stack(
            children: [
              Positioned.fill(
                child: Opacity(
                  opacity: 0.9,
                  child:
                      Image.asset('assets/background.jpg', fit: BoxFit.cover),
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    /* Center(
                      child: ClipOval(
                        child: Container(
                          width: 120,
                          height: 120,
                          color: Color.fromARGB(253, 20, 16, 16),
                          alignment: Alignment.center,
                          child: IconFont(
                            iconName: IconFontHelper.MAIN_LOGO,
                            color: Colors.white,
                            size: 60,
                          ),
                        ),
                      ),
                    ), */
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      'Bienvenido',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromARGB(255, 75, 22, 22),
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 40),
                    ElevatedButton(
                      style: botonestilo,
                      child: Text(
                        'Iniciar sesión',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, 'ruta_login');
                      },
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      style: botonestilo,
                      child: Text(
                        'Registrarse',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, 'ruta_registro_form');
                      },
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }

  final botonestilo = ElevatedButton.styleFrom(
    foregroundColor: Colors.white,
    backgroundColor: Color.fromARGB(255, 133, 9, 9),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    padding: EdgeInsets.symmetric(horizontal: 82.0, vertical: 15.0),
  );
}
