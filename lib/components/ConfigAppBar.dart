import 'package:flutter/material.dart';

class ConfigAppBar extends StatelessWidget {
  final String texto;

  const ConfigAppBar(this.texto);
  @override
  Widget build(BuildContext context) {
    return Text(
      texto,
      style: Theme.of(context).textTheme.headline3,
    );
  }
}
