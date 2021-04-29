import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      appBar: AppBar(
        title: Text(
          "Alterar Senha",
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
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
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CampoSenha extends StatefulWidget {
  final String labelText;
  final TextEditingController controlador;
  const CampoSenha({Key key, this.labelText, this.controlador})
      : super(key: key);

  @override
  _CampoSenhaState createState() => _CampoSenhaState();
}

class _CampoSenhaState extends State<CampoSenha> {
  bool senhaVisivel = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        keyboardType: TextInputType.text,
        controller: widget.controlador,
        obscureText: senhaVisivel,
        decoration: InputDecoration(
          labelText: widget.labelText,
          labelStyle: TextStyle(fontSize: 20, color: Colors.blueGrey[300]),
          suffixIcon: IconButton(
            icon: Icon(senhaVisivel ? Icons.visibility : Icons.visibility_off),
            onPressed: () {
              setState(() {
                senhaVisivel = !senhaVisivel;
              });
            },
          ),
        ),
      ),
    );
  }
}
