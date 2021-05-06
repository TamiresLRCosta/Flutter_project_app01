import 'package:app_mf_tc/components/ConfigAppBar.dart';
import 'package:flutter/material.dart';

class TelaLostSenha extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: ConfigAppBar("Esqueci minha senha")),
      body: Container(
        color: Colors.blueGrey[900],
        padding: EdgeInsets.only(top: 15, left: 30, right: 30, bottom: 15),
        child: ListView(
          padding: EdgeInsets.only(top: 70, left: 30, right: 30, bottom: 15),
          children: [
            Icon(Icons.password, size: 70, color: Colors.white70),

            SizedBox(height: 20),
            Text(
              'Preencha os campos abaixo para\nrecuperar sua senha',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w200),
            ),

            //campo 'CPF'
            SizedBox(height: 20),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'CPF',
                labelStyle: TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.w200,
                  fontSize: 20,
                ),
              ),
            ),

            //campo 'Data de nascimento'
            TextFormField(
              keyboardType: TextInputType.datetime,
              decoration: InputDecoration(
                labelText: 'Data de nascimento',
                labelStyle: TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.w200,
                  fontSize: 20,
                ),
              ),
            ),

            //btn 'Enviar"
            SizedBox(height: 100),
            SizedBox(
              width: 50,
              height: 60,
              child: ElevatedButton(
                child: Text(
                  'Enviar'.toUpperCase(),
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headline4,
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
