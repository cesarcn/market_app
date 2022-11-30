import 'package:flutter/material.dart';
/* import 'package:lab05/helpers/iconhelper.dart';
import 'package:lab05/widgets/iconfont.dart'; */

class SplashPage extends StatelessWidget {
  int duration = 0;
  Widget goToPage;

  SplashPage({required this.goToPage, required this.duration});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: this.duration), () {
      // Un FUTURE se utiliza para representar un valor potencial
      //o un error que estará disponible en algún momento en el futuro. Ideal para programación asíncrona en flutter
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: ((context) =>
                  this.goToPage))); // Para ir a la pagina de inicio
    });

    return Scaffold(
        body: Container(
            color: Color.fromARGB(255, 133, 9, 9),
            alignment: Alignment.center,
            child: Image.asset('image/home.png')));
  }
}
