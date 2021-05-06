import 'package:app_mf_tc/components/ConfigAppBar.dart';
import 'package:flutter/material.dart';

class TelaRegister extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: ConfigAppBar("Primeiro Acesso"), actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.help_outline),
          iconSize: 35,
          color: Colors.white70,
        )
      ]),
      body: Container(
        color: Colors.blueGrey[900],
        padding: EdgeInsets.only(top: 15, left: 30, right: 30, bottom: 15),
        child: ListView(
          children: [
            Padding(
                padding:
                    EdgeInsets.only(top: 15, left: 30, right: 30, bottom: 15)),
            Icon(
              Icons.person_add,
              size: 120,
              color: Colors.white70,
            ),

            //campo 'CPF'
            _Campo(TextInputType.number, "CPF"),

            //Campo 'data de nascimento'
            _Campo(TextInputType.datetime, "Data de Nascimento"),

            //Campo 'e-mail'
            _Campo(TextInputType.emailAddress, "E-mail"),

            //Campo 'celular'
            _Campo(TextInputType.phone, "Celular"),
            SizedBox(height: 30),

            //btn 'Enviar"
            SizedBox(
              width: 50,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/inicial');
                },
                child: Text(
                  "Enviar".toUpperCase(),
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Campo extends StatelessWidget {
  final TextInputType teclado;
  final String label;

  const _Campo(this.teclado, this.label);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        keyboardType: teclado,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: Colors.white70,
            fontWeight: FontWeight.w200,
            fontSize: 20,
          ),
        ),
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
