import 'package:app_mf_tc/components/RedirecionarURL.dart';
import 'package:app_mf_tc/model/ItemCarrossel.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CarrosselPromo extends StatefulWidget {
  @override
  _CarrosselPromoState createState() => _CarrosselPromoState();
}

class _CarrosselPromoState extends State<CarrosselPromo> {
  late CollectionReference itemCarrossel;

  @override
  void initState() {
    super.initState();
    itemCarrossel = FirebaseFirestore.instance.collection('itemCarrossel');
  }

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: StreamBuilder<QuerySnapshot>(
        stream: itemCarrossel.snapshots(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Center(child: Text('Erro ao conectar ao Firestore'));

            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());

            default:
              final dados = snapshot.requireData;

              return CarouselSlider.builder(
                itemCount: dados.size,
                options: CarouselOptions(height: 400.0),
                itemBuilder: (context, index, realIdx) {
                  return exibirPromo(dados.docs[index]);
                },
              );
          }
        },
      ),
    );
  }

  Widget exibirPromo(item) {
    ItemCarrossel itemPromo = ItemCarrossel.fromJson(item.data(), item.id);

    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).primaryColor,
      ),
      child: InkWell(
        onTap: () {
          redirecionarURL();
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              itemPromo.desc,
              style: TextStyle(fontSize: 20),
            ),
            Container(
              height: 250,
              child: Image.asset(
                'lib/Imagens/${itemPromo.img}.png',
              ),
            ),
            Text(
              'De R\$ ${itemPromo.valorAntigo}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Por R\$ ${itemPromo.valorNovo}',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),
            )
          ],
        ),
      ),
    );
  }
}
