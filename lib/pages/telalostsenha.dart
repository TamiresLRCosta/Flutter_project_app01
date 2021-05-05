import 'package:flutter/material.dart';

class TelaLostSenha extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Esqueci Minha Senha'),
        backgroundColor: Colors.blueGrey[800],        
      ),

      body: Container(
        color: Colors.blueGrey[900],
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(top: 70, left: 10, right: 10, bottom: 15),
          children: [
            Icon(Icons.password, size: 50, color: Colors.white70),
            SizedBox(height: 20),
            Text('Preencha os campos abaixo para\nrecuperar sua senha',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w200),        
            ),

            //campo 'CPF'
            SizedBox(height: 40),
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
            SizedBox(height: 10),
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
            SizedBox(height: 90),
            SizedBox(
              width: 50,
              height: 60,
              child: ElevatedButton(
                child: Text(
                  'Enviar'.toUpperCase(),
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: Colors.blueGrey[900]),
                ),
                onPressed: () {},
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0))
                  )
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}