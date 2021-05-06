import 'package:flutter/material.dart';

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
          physics: const NeverScrollableScrollPhysics(),
          children: [
            //logo
            SizedBox(
              width: 500,
              height: 300,
              child: Image.asset('lib/Imagens/logo.png'),
            ),
            //space between
            SizedBox(height: 40),
            //button entrar
            SizedBox(
              width: 50,
              height: 60,
              child: ElevatedButton(
                child: Text('Entrar'.toUpperCase(),
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headline4),
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
              ),
            ),
            SizedBox(height: 30),
            //button criar conta
            SizedBox(
              width: 50,
              height: 50,
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/registrar');
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
                  Navigator.pushNamed(context, '/sobre');
                },
                icon: Icon(Icons.info),
                label: Text('Sobre nós'),
                style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all(Colors.amber[400])),
              ),
            ),
          )),
    );
  }
}
