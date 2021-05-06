import 'package:app_mf_tc/components/CampoSenha.dart';
import 'package:app_mf_tc/components/ConfigAppBar.dart';
import 'package:flutter/material.dart';

class AlterarSenha extends StatefulWidget {
  @override
  _AlterarSenhaState createState() => _AlterarSenhaState();
}

class _AlterarSenhaState extends State<AlterarSenha> {
  bool senhaVisivel;
  final TextEditingController controladorCampoSenhaAtual =
      TextEditingController();
  final TextEditingController controladorCampoNovaSenha =
      TextEditingController();
  final TextEditingController controladorCampoConfirmarSenha =
      TextEditingController();
  @override
  void initState() {
    senhaVisivel = false;
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(title: ConfigAppBar("Alterar Senha")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Center(
                child: Icon(
                  Icons.vpn_key_rounded,
                  size: 50,
                ),
              ),
            ),
            Text(
              "Preencha os campos abaixo",
              style: Theme.of(context).textTheme.headline2,
            ),
            Text(
              "para alterar sua senha",
              style: Theme.of(context).textTheme.headline2,
            ),
            CampoSenha(
              controlador: controladorCampoSenhaAtual,
              labelText: "Senha Atual",
            ),
            CampoSenha(
              controlador: controladorCampoNovaSenha,
              labelText: "Nova Senha",
            ),
            CampoSenha(
              controlador: controladorCampoConfirmarSenha,
              labelText: "Confirmar Senha",
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () async {
                  await showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Senha Alterada com sucesso!"),
                        content: ElevatedButton(
                          onPressed: () {
                            Navigator.popAndPushNamed(context, '/principal');
                          },
                          child: Text(
                            "Ok",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Text(
                  "Confirmar Alteração",
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
