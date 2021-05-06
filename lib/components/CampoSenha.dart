import 'package:flutter/material.dart';

class CampoSenha extends StatefulWidget {
  final String labelText;
  final TextEditingController controlador;
  const CampoSenha({Key key, this.labelText, this.controlador})
      : super(key: key);

  @override
  _CampoSenhaState createState() => _CampoSenhaState();
}

class _CampoSenhaState extends State<CampoSenha> {
  bool senhaVisivel = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        keyboardType: TextInputType.text,
        controller: widget.controlador,
        obscureText: senhaVisivel,
        decoration: InputDecoration(
          labelText: widget.labelText,
          labelStyle: TextStyle(fontSize: 20, color: Colors.blueGrey[300]),
          suffixIcon: IconButton(
            icon: Icon(senhaVisivel ? Icons.visibility : Icons.visibility_off),
            onPressed: () {
              setState(() {
                senhaVisivel = !senhaVisivel;
              });
            },
          ),
        ),
      ),
    );
  }
}