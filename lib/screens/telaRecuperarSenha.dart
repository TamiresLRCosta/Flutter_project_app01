import 'package:app_mf_tc/components/ConfigAppBar.dart';
import 'package:flutter/material.dart';

class TelaLostSenha extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: ConfigAppBar("Esqueci minha senha")),
      body: Container(
        color: Colors.blueGrey[900],
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.all(30),
              child: Icon(Icons.password, size: 70, color: Colors.white70),
            ),

            Container(
              margin: EdgeInsets.only(bottom: 40),
              child: Text(
                'Preencha os campos abaixo para\nrecuperar sua senha',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w200),
              ),
            ),

            //campo 'CPF'
            _Campo('CPF', TextInputType.number),

            //campo 'Data de nascimento'
            _Campo('Data de Nascimento', TextInputType.datetime),

            //btn 'Enviar"
            SizedBox(height: 100),
            SizedBox(
              width: 50,
              height: 60,
              child: ElevatedButton(
                child: Text(
                  'Enviar'.toUpperCase(),
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headline4,
                ),
                onPressed: () async {
                  await showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(
                          "Nova senha enviada para o \ne-mail cadastrado.",
                          textAlign: TextAlign.center,
                        ),
                        content: ElevatedButton(
                          onPressed: () {
                            Navigator.popAndPushNamed(context, '/inicial');
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Campo extends StatelessWidget {
  final String label;
  final TextInputType teclado;

  const _Campo(this.label, this.teclado);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        keyboardType: teclado,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: Colors.white70,
            fontWeight: FontWeight.w200,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
