import 'package:flutter/material.dart';
import 'package:lab05/widgets/menu_lateral.dart';

class PrincipalScreen extends StatefulWidget {
  @override
  createState() => _PrincipalScreen();
}

class _PrincipalScreen extends State<PrincipalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TechStore'),
        backgroundColor: Color.fromARGB(255, 133, 9, 9),
      ),
      drawer: const MenuLateral(),
      body: Center(
        child: Text('Principal'),
      ),
    );
  }
}
