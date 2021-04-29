import 'package:app_mf_tc/pages/telasTamires/telalostsenha.dart';
import 'package:flutter/material.dart';

class TelaLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey[800],
      ),
      body: Container(
        color: Colors.blueGrey[900],
        padding: EdgeInsets.only(top: 15, left: 30, right: 30, bottom: 15),
        child: ListView(
          children: [
            Padding(
                padding:
                    EdgeInsets.only(top: 15, left: 30, right: 30, bottom: 15)),
            Icon(Icons.account_circle_sharp, size: 150, color: Colors.white70),
            SizedBox(
              height: 60,
            ),
            //campo CPF
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                //focusedBorder: OutlineInputBorder(
                //  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                //  borderSide: BorderSide(color: Colors.white70)),
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
                //focusedBorder: OutlineInputBorder(
                //borderRadius: BorderRadius.all(Radius.circular(5.0)),
                //borderSide: BorderSide(color: Colors.white70)),
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TelaLostSenha()));
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
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      color: Colors.white),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TelaLogin()));
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.blueGrey[800]),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.white54),
                    ))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
