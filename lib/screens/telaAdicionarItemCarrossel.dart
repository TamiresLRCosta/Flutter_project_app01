import 'package:app_mf_tc/components/Campo.dart';
import 'package:app_mf_tc/components/ConfigAppBar.dart';
import 'package:app_mf_tc/components/dialogOk.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TelaAdicionarItemCarrossel extends StatefulWidget {
  @override
  _TelaAdicionarItemCarrosselState createState() =>
      _TelaAdicionarItemCarrosselState();
}

class _TelaAdicionarItemCarrosselState
    extends State<TelaAdicionarItemCarrossel> {
  final TextEditingController controladorCampoDesc = TextEditingController();
  final TextEditingController controladorCampoImg = TextEditingController();
  final TextEditingController controladorCampoValorAntigo =
      TextEditingController();
  final TextEditingController controladorCampoValorNovo =
      TextEditingController();

  void getDocumentById(String id) async {
    await FirebaseFirestore.instance
        .collection('itemCarrossel')
        .doc(id)
        .get()
        .then((valor) {
      controladorCampoDesc.text = valor.get('desc');
      controladorCampoImg.text = valor.get('img');
      controladorCampoValorAntigo.text = valor.get('valorAntigo');
      controladorCampoValorNovo.text = valor.get('valorNovo');
    });
  }

  @override
  Widget build(BuildContext context) {
    var id = ModalRoute.of(context)?.settings.arguments;

    if (id != null) {
      if (controladorCampoDesc.text == '' &&
          controladorCampoImg.text == '' &&
          controladorCampoValorAntigo.text == '' &&
          controladorCampoValorNovo.text == '') {
        getDocumentById(id.toString());
      }
    }

    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(title: ConfigAppBar("Item Carrossel")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Center(
                child: Icon(
                  Icons.production_quantity_limits_outlined,
                  size: 50,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Center(
                child: Text(
                  "Preencha os campos abaixo para adicionar um item ao carrossel",
                  style: Theme.of(context).textTheme.headline2,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            // Text(
            //   "para adicionar um item ao carrossel",
            //   style: Theme.of(context).textTheme.headline2,
            // ),
            Campo(
                label: "Descrição",
                controlador: controladorCampoDesc,
                teclado: TextInputType.name),
            Campo(
                label: "Imagem",
                controlador: controladorCampoImg,
                teclado: TextInputType.name),
            Campo(
                label: "Valor Antigo",
                controlador: controladorCampoValorAntigo,
                teclado: TextInputType.number),
            Campo(
                label: "Valor Novo",
                controlador: controladorCampoValorNovo,
                teclado: TextInputType.number),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.35,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
                  child: ElevatedButton(
                    onPressed: () async {
                      var db = FirebaseFirestore.instance;

                      if (id == null) {
                        db.collection('itemCarrossel').add({
                          'desc': controladorCampoDesc.text,
                          'img': controladorCampoImg.text,
                          'valorAntigo': controladorCampoValorAntigo.text,
                          'valorNovo': controladorCampoValorNovo.text,
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
                        db
                            .collection('itemCarrossel')
                            .doc(id.toString())
                            .update({
                          'desc': controladorCampoDesc.text,
                          'img': controladorCampoImg.text,
                          'valorAntigo': controladorCampoValorAntigo.text,
                          'valorNovo': controladorCampoValorNovo.text,
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
