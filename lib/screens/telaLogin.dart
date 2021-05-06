import 'package:app_mf_tc/components/ConfigAppBar.dart';
import 'package:flutter/material.dart';

class TelaLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: ConfigAppBar("Login")),
      body: Container(
        color: Colors.blueGrey[900],
        padding: EdgeInsets.only(top: 15, left: 30, right: 30, bottom: 15),
        child: ListView(
          children: [
            Padding(
                padding:
                    EdgeInsets.only(top: 15, left: 30, right: 30, bottom: 15)),
            Icon(Icons.account_circle_sharp, size: 120, color: Colors.white70),
            SizedBox(
              height: 60,
            ),
            //campo CPF
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
              style: TextStyle(fontSize: 20),
            ),

            SizedBox(height: 10),
            //campo senha
            TextFormField(
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Senha',
                labelStyle: TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.w200,
                  fontSize: 20,
                ),
              ),
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            //btn 'esqueci minha senha'
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/recuperarSenha');
              },
              child: Text(
                'Esqueci minha senha',
                style: TextStyle(color: Colors.white70),
              ),
            ),
            //btn Entrar
            SizedBox(height: 30),
            SizedBox(
              width: 300,
              height: 60,
              child: ElevatedButton(
                child: Text(
                  'Entrar'.toUpperCase(),
                  style: Theme.of(context).textTheme.headline4,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/principal');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
