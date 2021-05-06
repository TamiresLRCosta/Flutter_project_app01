import 'package:flutter/material.dart';

class TelaMinhaFatura extends StatefulWidget {
  @override
  _TelaMinhaFaturaState createState() => _TelaMinhaFaturaState();
}

class _TelaMinhaFaturaState extends State<TelaMinhaFatura> {
  final List<ItemFatura> lista = [];

  ItemFatura giga = ItemFatura('29/08/2020', 'Giga (8/10)', r'R$ 19,69');
  ItemFatura mlar = ItemFatura('25/08/2020', 'Maravilhas Do Lar NOME GRANDE (7/10)', r'R$ 14,90');
  ItemFatura ppag = ItemFatura('28/08/2020', 'PINPAG', r'R$ 52,75');
  @override
  void initState() {
    lista.add(giga);
    lista.add(mlar);
    lista.add(ppag);
    lista.add(giga);
    lista.add(mlar);
    lista.add(ppag);
    super.initState();
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
              margin: EdgeInsets.symmetric(vertical: 30),
              child: ListView.builder(
                itemCount: lista.length,
                itemBuilder: (context, index) {
                  final _item = lista[index];
                  return ListTileFatura(_item);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ItemFatura {
  final String data;
  final String desc;
  final String valor;

  ItemFatura(this.data, this.desc, this.valor);
}

class ListTileFatura extends StatelessWidget {
  final ItemFatura _item;

  const ListTileFatura(this._item);
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueGrey[800],
      child: ListTile(
        leading: Text(_item.data),
        title: Text(_item.desc),
        trailing: Text(_item.valor),
      ),
    );
  }
}

class Data extends StatelessWidget {
  final String dataText;
  final String labelText;

  const Data({Key key, this.dataText, this.labelText}) : super(key: key);

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
