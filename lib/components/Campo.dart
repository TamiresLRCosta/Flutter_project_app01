import 'package:flutter/material.dart';

class Campo extends StatelessWidget {
  final TextEditingController controlador;
  final String label;
  final TextInputType teclado;

  const Campo(
      {required this.controlador, required this.label, required this.teclado});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        keyboardType: teclado,
        style: TextStyle(fontSize: 20),
        controller: controlador,
        decoration: InputDecoration(
          labelStyle: TextStyle(fontSize: 20, color: Colors.blueGrey[300]),
          labelText: label,
        ),
      ),
    );
  }
}
