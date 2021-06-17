import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardPrincipal extends StatefulWidget {
  @override
  _CardPrincipalState createState() => _CardPrincipalState();
}

class _CardPrincipalState extends State<CardPrincipal> {
  // User? user = FirebaseAuth.instance.currentUser;
  // var valorParcial;
  // var limite;
  // var f = NumberFormat("####.00", "pt_BR");

  // void getDocumentById(String id) async {
  //   await FirebaseFirestore.instance
  //       .collection('usuarios')
  //       .doc(id)
  //       .get()
  //       .then((valor) {
  //     valorParcial = valor.get('valorParcial');
  //     limite = valor.get('limite');
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    //getDocumentById(user!.uid.toString());

    return Container(
      margin: EdgeInsets.all(15),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.amber[600],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.credit_card,
                  size: 40,
                  color: Colors.blueGrey[700],
                ),
                Text("Minha Fatura",
                    style: Theme.of(context).textTheme.headline1),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.white70),
                  onPressed: () {
                    Navigator.pushNamed(context, '/minhaFatura');
                  },
                  child: Text(
                    "Ver Fatura",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _TextoAdaptavel("Valor Parcial:"),
                  _TextoAdaptavel(r"R$ 200,00"),
                  _TextoAdaptavel("Vencimento:"),
                  _TextoAdaptavel("25/04"),
                  _TextoAdaptavel("_________________"),
                  _TextoAdaptavel("Limite Disponivel:"),
                  _TextoAdaptavel(r"R$ 25,00"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TextoAdaptavel extends StatelessWidget {
  final String texto;

  const _TextoAdaptavel(this.texto);
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fitWidth,
      child: Text(
        texto,
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }
}

/*
  
*/

