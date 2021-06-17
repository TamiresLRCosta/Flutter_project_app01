import 'package:flutter/material.dart';

class DialogOk extends StatelessWidget {
  final String texto;
  final String? rota;

  const DialogOk({Key? key, required this.texto, this.rota}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        texto,
        textAlign: TextAlign.center,
      ),
      content: ElevatedButton(
        onPressed: () {
          if (rota != null) {
            Navigator.popAndPushNamed(context, rota.toString());
          } else {
            Navigator.pop(context);
          }
        },
        child: Text(
          "Ok",
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
