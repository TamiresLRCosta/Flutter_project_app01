import 'package:app_mf_tc/pages/telalostsenha.dart';
import 'package:flutter/material.dart';

class TelaLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: Text('Login',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey[800],
      ),
      body: Container(
        color: Colors.blueGrey[900],                
        padding: EdgeInsets.all(10),
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Padding(padding: EdgeInsets.only(left: 30, right: 30)),
            Icon(Icons.account_circle, size: 150, color: Colors.white70),
            SizedBox(height: 60,),
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
            TextButton(onPressed: () {
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => TelaLostSenha()));
            }, 
              child: Text('Esqueci minha senha', style: TextStyle(color: Colors.white70, fontSize: 15),),              
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
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: Colors.blueGrey[900]),
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
          ],
        ),
        
      ),
    );
  }
}
