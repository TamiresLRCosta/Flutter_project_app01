import 'package:app_mf_tc/pages/telainfo.dart';
import 'package:app_mf_tc/pages/telaregister.dart';
import 'package:flutter/material.dart';
import 'package:app_mf_tc/pages/telalogin.dart';

class TelaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blueGrey[900],
        padding: EdgeInsets.only(
          top: 60,
          left: 40,
          right: 40,
        ),
        child: ListView(
          children: [
            //logo
            SizedBox(
              width: 500,
              height: 300,
              child: Image.asset('lib/Imagens/logo.png'),
            ),
            //space between
            SizedBox(height: 120),
            //button entrar
            SizedBox(
              width: 50,
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
            SizedBox(height: 30),
            //button criar conta
            SizedBox(
              width: 1,
              height: 18,
              child: TextButton(
                onPressed: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TelaRegister()));
                },
                child: Text(
                  'Primeiro Acesso',
                  textAlign: TextAlign.center,
                ),
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white)),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blueGrey[700],
        child: Container(
          child: SizedBox(
            width: 20,
            height: 30,
            child: TextButton.icon(
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TelaInfo()));
              },
              icon: Icon(Icons.info),
              label: Text('Sobre nós'),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.amber[400])
              ),
            ),
          ),
        )
      ),
    );
  }
}
