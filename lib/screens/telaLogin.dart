import 'package:app_mf_tc/components/Campo.dart';
import 'package:app_mf_tc/components/CampoSenha.dart';
import 'package:app_mf_tc/components/ConfigAppBar.dart';
import 'package:app_mf_tc/components/dialogOk.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TelaLogin extends StatefulWidget {
  @override
  _TelaLoginState createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  final TextEditingController controladorCampoEmail = TextEditingController();
  final TextEditingController controladorCampoSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: ConfigAppBar("Login")),
      body: Container(
        color: Colors.blueGrey[900],
        padding: EdgeInsets.symmetric(vertical: 15),
        child: ListView(
          children: [
            Icon(Icons.account_circle_sharp, size: 120, color: Colors.white70),
            SizedBox(
              height: 60,
            ),
            //campo Email
            Campo(
                controlador: controladorCampoEmail,
                label: "E-mail",
                teclado: TextInputType.emailAddress),
            CampoSenha(controlador: controladorCampoSenha, labelText: "Senha"),
            //btn 'esqueci minha senha'
            Container(
              padding: EdgeInsets.only(top: 20),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/recuperarSenha');
                },
                child: Text(
                  'Esqueci minha senha',
                  style: TextStyle(color: Colors.white70),
                ),
              ),
            ),
            //btn Entrar
            SizedBox(height: 30),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                child: Text(
                  'Entrar'.toUpperCase(),
                  style: Theme.of(context).textTheme.headline4,
                ),
                onPressed: () {
                  login(controladorCampoEmail.text, controladorCampoSenha.text);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void login(email, senha) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: senha)
        .then((resultado) {
      Navigator.pushReplacementNamed(context, '/principal');
    }).catchError((erro) async {
      var mensagem = '';
      if (erro.code == 'user-not-found') {
        mensagem = 'ERRO: email ou senha inválido.';
      } else if (erro.code == 'wrong-password') {
        mensagem = 'ERRO: email ou senha inválido.';
      } else if (erro.code == 'invalid-email') {
        mensagem = 'ERRO: formato de email inválido.';
      } else {
        mensagem = 'ERRO: ${erro.message}';
      }
      await showDialog(
        context: context,
        builder: (context) {
          return DialogOk(
            texto: mensagem,
          );
        },
      );
    });
  }
}
