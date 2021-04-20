import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    theme: ThemeData(
      accentColor: Colors.orange
      primaryColor: Colors.blueGrey,
      brightness: Brightness.dark,
    ),
    home: TelaPrincipal(),
  ),
);
