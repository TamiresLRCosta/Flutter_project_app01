import 'package:app_mf_tc/components/Campo.dart';
import 'package:app_mf_tc/components/ConfigAppBar.dart';
import 'package:app_mf_tc/components/dialogOk.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TelaAdicionarItemFatura extends StatefulWidget {
  @override
  _TelaAdicionarItemFaturaState createState() =>
      _TelaAdicionarItemFaturaState();
}

class _TelaAdicionarItemFaturaState extends State<TelaAdicionarItemFatura> {
  final TextEditingController controladorCampoData = TextEditingController();
  final TextEditingController controladorCampoDesc = TextEditingController();
  final TextEditingController controladorCampoValor = TextEditingController();
  User? user = FirebaseAuth.instance.currentUser;

  void getDocumentById(String id) async {
    await FirebaseFirestore.instance
        .collection('usuarios')
        .doc(user!.uid)
        .collection('itemFatura')
        .doc(id)
        .get()
        .then((valor) {
      controladorCampoData.text = valor.get('data');
      controladorCampoDesc.text = valor.get('desc');
      controladorCampoValor.text = valor.get('valor');
    });
  }

  @override
  Widget build(BuildContext context) {
    var id = ModalRoute.of(context)?.settings.arguments;

    if (id != null) {
      if (controladorCampoData.text == '' &&
          controladorCampoDesc.text == '' &&
          controladorCampoValor.text == '') {
        getDocumentById(id.toString());
      }
    }

    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(title: ConfigAppBar("Prova de Conceito")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Center(
                child: Icon(
                  Icons.document_scanner_rounded,
                  size: 50,
                ),
              ),
            ),
            Text(
              "Preencha os campos abaixo",
              style: Theme.of(context).textTheme.headline2,
            ),
            Text(
              "para gerar um documento",
              style: Theme.of(context).textTheme.headline2,
            ),
            Campo(
                label: "Data",
                controlador: controladorCampoData,
                teclado: TextInputType.datetime),
            Campo(
                label: "Descrição",
                controlador: controladorCampoDesc,
                teclado: TextInputType.name),
            Campo(
                label: "Valor",
                controlador: controladorCampoValor,
                teclado: TextInputType.number),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.35,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
                  child: ElevatedButton(
                    onPressed: () async {
                      var db = FirebaseFirestore.instance
                          .collection('usuarios')
                          .doc(user!.uid);

                      if (id == null) {
                        db.collection('itemFatura').add({
                          'data': controladorCampoData.text,
                          'desc': controladorCampoDesc.text,
                          'valor': controladorCampoValor.text,
                        });

                        await showDialog(
                          context: context,
                          builder: (context) {
                            return DialogOk(
                                texto: "Documento inserido com sucesso!",
                                rota: '/principal');
                          },
                        );
                      } else {
                        db.collection('itemFatura').doc(id.toString()).update({
                          'data': controladorCampoData.text,
                          'desc': controladorCampoDesc.text,
                          'valor': controladorCampoValor.text,
                        });

                        await showDialog(
                          context: context,
                          builder: (context) {
                            return DialogOk(
                                texto: "Documento atualizado com sucesso!",
                                rota: '/principal');
                          },
                        );
                      }
                    },
                    child: Text(
                      "Salvar",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.35,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/principal');
                    },
                    child: Text(
                      "Cancelar",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
