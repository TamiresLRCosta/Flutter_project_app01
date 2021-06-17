import 'package:app_mf_tc/components/Campo.dart';
import 'package:app_mf_tc/components/ConfigAppBar.dart';
import 'package:app_mf_tc/components/dialogOk.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TelaRegister extends StatefulWidget {
  @override
  _TelaRegisterState createState() => _TelaRegisterState();
}

class _TelaRegisterState extends State<TelaRegister> {
  TextEditingController controladorCampoNome = TextEditingController();
  TextEditingController controladorCampoCPF = TextEditingController();
  TextEditingController controladorCampoNascimento = TextEditingController();
  TextEditingController controladorCampoEmail = TextEditingController();
  TextEditingController controladorCampoCelular = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: ConfigAppBar("Primeiro Acesso"), actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.help_outline),
          iconSize: 35,
          color: Colors.white70,
        )
      ]),
      body: Container(
        color: Colors.blueGrey[900],
        padding: EdgeInsets.symmetric(vertical: 30),
        child: ListView(
          children: [
            Icon(
              Icons.person_add,
              size: 90,
              color: Colors.white70,
            ),

            //campo 'Nome Completo'
            Campo(
                teclado: TextInputType.name,
                label: "Nome Completo",
                controlador: controladorCampoNome),
            Campo(
                teclado: TextInputType.number,
                label: "CPF",
                controlador: controladorCampoCPF),
            Campo(
                teclado: TextInputType.datetime,
                label: "Data de Nascimento",
                controlador: controladorCampoNascimento),
            Campo(
                teclado: TextInputType.emailAddress,
                label: "E-mail",
                controlador: controladorCampoEmail),
            Campo(
                teclado: TextInputType.phone,
                label: "Celular",
                controlador: controladorCampoCelular),

            SizedBox(height: 30),

            //btn 'Enviar"
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () async {
                  criarConta(
                      nome: controladorCampoNome.text,
                      cpf: controladorCampoCPF.text,
                      nascimento: controladorCampoNascimento.text,
                      email: controladorCampoEmail.text,
                      celular: controladorCampoCelular.text,
                      senha: "123456");
                },
                child: Text(
                  "Enviar".toUpperCase(),
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void criarConta(
      {required nome,
      required email,
      required senha,
      required cpf,
      required celular,
      required nascimento}) {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: senha)
        .then((resultado) {
      //Armazenar dados adicionais no Firestore
      var db = FirebaseFirestore.instance;
      db.collection('usuarios').doc(resultado.user!.uid).set({
        'nome': nome,
        'email': email,
        'cpf': cpf,
        'celular': celular,
        'nascimento': nascimento,
      }).then((valor) async {
        await showDialog(
            context: context,
            builder: (context) {
              return DialogOk(
                texto:
                    "Uma senha de acesso foi enviada para o seu email e celular.",
                rota: '/inicial',
              );
            });
      });
    }).catchError((erro) async {
      var mensagem = "";
      if (erro.code == 'email-already-in-use') {
        mensagem = "ERRO: O email informado já está em uso.";
      } else if (erro.code == 'invalid-email') {
        mensagem = "ERRO: Formato de email inválido.";
      } else if (erro.code == 'weak-password') {
        mensagem = "ERRO: Senha Fraca.";
      } else {
        mensagem = "ERRO: ${erro.message}";
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
