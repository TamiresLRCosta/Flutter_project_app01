import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TelaPerfil extends StatefulWidget {
  @override
  _TelaPerfilState createState() => _TelaPerfilState();
}

class _TelaPerfilState extends State<TelaPerfil> {
  final TextEditingController controladorCampoNome = TextEditingController();
  final TextEditingController controladorCampoCel = TextEditingController();
  final TextEditingController controladorCampoEmail = TextEditingController();
  final TextEditingController controladorCampoCPF = TextEditingController();
  User? user = FirebaseAuth.instance.currentUser;

  void getDocumentById(String id) async {
    await FirebaseFirestore.instance
        .collection('usuarios')
        .doc(id)
        .get()
        .then((valor) {
      controladorCampoNome.text = valor.get('nome');
      controladorCampoCel.text = valor.get('celular');
      controladorCampoCPF.text = valor.get('cpf');
      controladorCampoEmail.text = valor.get('email');
    });
  }

  @override
  Widget build(BuildContext context) {
    getDocumentById(user!.uid.toString());
    final String? nome = user!.displayName.toString();

    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        title: Text(
          "Perfil",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(20),
              child: Row(children: [
                Icon(
                  Icons.person_sharp,
                  size: 70,
                ),
                SizedBox(width: 30),
                Text(
                  "Bom dia,\n$nome!",
                  style: TextStyle(fontSize: 25),
                ),
              ]),
            ),
            _Campo(controlador: controladorCampoNome, label: "Nome"),
            _Campo(controlador: controladorCampoCel, label: "Cel"),
            _Campo(controlador: controladorCampoEmail, label: "E-Mail"),
            _Campo(controlador: controladorCampoCPF, label: "CPF"),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/alterarSenha');
                },
                child: Text(
                  "Alterar Senha do App",
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Campo extends StatelessWidget {
  final TextEditingController controlador;
  final String label;

  const _Campo({required this.controlador, required this.label});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        style: TextStyle(fontSize: 20),
        enabled: false,
        controller: controlador,
        decoration: InputDecoration(
          labelStyle: TextStyle(fontSize: 20, color: Colors.blueGrey[300]),
          labelText: label,
        ),
      ),
    );
  }
}
