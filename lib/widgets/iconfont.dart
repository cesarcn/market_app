import 'package:flutter/material.dart';

class IconFont extends StatelessWidget {
  // Creamos una clase para crear un icono
  // Variables
  Color color;
  double size;
  String iconName;

  IconFont(
      {required this.color,
      required this.size,
      required this.iconName}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Text(
      this.iconName,
      style: TextStyle(
          color: this.color, fontSize: this.size, fontFamily: 'hospital'),
    );
  }
}
