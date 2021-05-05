import 'package:flutter/material.dart';

class TelaRegister extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Primeiro Acesso'),
        backgroundColor: Colors.blueGrey[800],
        actions: [IconButton(
          onPressed: () {},
          icon: Icon(Icons.help_outline),
          iconSize: 35,
          color: Colors.white70,
        )],
      ),
      body: Container(
        color: Colors.blueGrey[900],
        //padding: EdgeInsets.only(top: 15, left: 30, right: 30, bottom: 15),
        padding: EdgeInsets.all(10),
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Padding(padding: EdgeInsets.only(left: 30, right: 30, bottom: 15)),
            Icon(
              Icons.person_add_alt_1_rounded,
              size: 120,
              color: Colors.white70,
            ),

            //campo 'CPF'
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

            //Campo 'data de nascimento'
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
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),

            //Campo 'e-mail'
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'E-mail',
                labelStyle: TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.w200,
                  fontSize: 20,
                ),
              ),
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),

            //Campo 'celular'
            TextFormField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Celular',
                labelStyle: TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.w200,
                  fontSize: 20,
                ),
              ),
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 30),

            //btn 'Enviar"
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
