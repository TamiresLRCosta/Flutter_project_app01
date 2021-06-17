import 'package:app_mf_tc/model/ItemFatura.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TelaMinhaFatura extends StatefulWidget {
  @override
  _TelaMinhaFaturaState createState() => _TelaMinhaFaturaState();
}

class _TelaMinhaFaturaState extends State<TelaMinhaFatura> {
  late CollectionReference itemFatura;
  User? user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    if (user != null) {
      itemFatura = FirebaseFirestore.instance
          .collection('usuarios')
          .doc(user!.uid)
          .collection('itemFatura');
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        title: Text(
          "Minha Fatura",
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(20, 35, 20, 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Data(
                  labelText: "Data de Fechamento",
                  dataText: "15/04/2021",
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 0.5,
                      color: Colors.blueGrey,
                    ),
                  ),
                  height: 40,
                ),
                Data(
                  labelText: "Data de Vencimento",
                  dataText: "25/04/2021",
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 0, 20, 10),
            decoration: BoxDecoration(
              border: Border.all(
                width: 0.5,
                color: Colors.blueGrey,
              ),
            ),
            width: double.infinity,
          ),
          Center(
            child: Container(
              child: Data(
                labelText: "Valor Parcial",
                dataText: r"R$ 200,00",
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: StreamBuilder<QuerySnapshot>(
                //Data Source
                stream: itemFatura.snapshots(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      return Center(
                          child: Text('Erro ao conectar ao Firestore'));

                    case ConnectionState.waiting:
                      return Center(child: CircularProgressIndicator());

                    default:
                      final dados = snapshot.requireData;

                      return ListView.builder(
                        itemCount: dados.size,
                        itemBuilder: (context, index) {
                          return exibirDocumento(dados.docs[index]);
                        },
                      );
                  }
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget exibirDocumento(item) {
    ItemFatura itemFatura = ItemFatura.fromJson(item.data(), item.id);

    return Card(
      color: Colors.blueGrey[800],
      child: ListTile(
        leading: Text(itemFatura.data),
        title: Text(itemFatura.desc),
        trailing: Text("R\$ ${itemFatura.valor}"),
        onTap: () {
          Navigator.pushNamed(context, '/itemFatura', arguments: itemFatura.id);
        },
      ),
    );
  }
}

class Data extends StatelessWidget {
  final String dataText;
  final String labelText;

  const Data({required this.dataText, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          labelText,
          style: TextStyle(fontSize: 15),
        ),
        Text(
          dataText,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
