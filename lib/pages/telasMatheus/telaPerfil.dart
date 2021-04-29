import 'package:flutter/material.dart';

class TelaPerfil extends StatelessWidget {
  final TextEditingController controladorCampoNome = TextEditingController();
  final TextEditingController controladorCampoCel = TextEditingController();
  final TextEditingController controladorCampoEmail = TextEditingController();
  final TextEditingController controladorCampoCPF = TextEditingController();
  @override
  Widget build(BuildContext context) {
    controladorCampoNome.text = "Matheus Fernando Duarte de Souza";
    controladorCampoCel.text = "(16)98814-4694";
    controladorCampoEmail.text = "matheus.souza107@fatec.sp.gov.br";
    controladorCampoCPF.text = "123.456.789-0";
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        title: Text(
          "Perfil",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
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
                "Bom dia,\nUsuário!",
                style: TextStyle(fontSize: 25),
              ),
            ]),
          ),
          Campo(controlador: controladorCampoNome, label: "Nome"),
          Campo(controlador: controladorCampoCel, label: "Cel"),
          Campo(controlador: controladorCampoEmail, label: "E-Mail"),
          Campo(controlador: controladorCampoCPF, label: "CPF"),
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
                style: TextStyle(fontSize: 25),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Campo extends StatelessWidget {
  final TextEditingController controlador;
  final String label;

  const Campo({this.controlador, this.label});
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
