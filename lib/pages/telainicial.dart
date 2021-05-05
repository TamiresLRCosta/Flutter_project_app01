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
        padding: EdgeInsets.all(10),
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            //logo
            SizedBox(              
              width: double.infinity,
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
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: Colors.blueGrey[900]
                  ),
                ),
                onPressed: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TelaLogin()));
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0))
                  )
                ),
              ),
            ),
            SizedBox(height: 30),
            //button criar conta
            SizedBox(
              width: 50,
              height: 50,
              child: TextButton(
                onPressed: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TelaRegister()));
                },
                child: Text(
                  'Primeiro Acesso',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15),
                ),
                style: ButtonStyle(                  
                    foregroundColor: MaterialStateProperty.all(Colors.white70)),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blueGrey[700],
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
        )
      ),
    );
  }
}
