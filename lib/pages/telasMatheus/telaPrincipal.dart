import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class TelaPrincipal extends StatefulWidget {
  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  var lista = [];

  @override
  void initState() {
    lista.add("lib/Imagens/bermudaAdidas.png");
    lista.add("lib/Imagens/camisaAdidas.png");
    lista.add("lib/Imagens/chineloAdidas.png");
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      drawer: Drawer(
        child: ListView(
          children: [
            //LOGO DO APP
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              child: Center(
                child: Image.asset("lib/Imagens/logo.png"),
              ),
            ),
            ItemMenu(
              texto: "Perfil",
              icone: Icons.person,
              rota: "/perfil",
            ),
            ItemMenu(
              texto: "Sobre",
              icone: Icons.person_outline,
              rota: "/sobre",
            ),
            ItemMenu(
              texto: "Sair",
              icone: Icons.logout,
              rota: "/login",
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Olá, Usuário!",
                style: Theme.of(context).textTheme.headline3,
              ),
              SizedBox(
                child: Image.asset("lib/Imagens/logo.png"),
                width: 100,
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(15),
              width: double.infinity,
              height: 200,
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
                          style:
                              ElevatedButton.styleFrom(primary: Colors.white70),
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
                          Text("Valor Parcial:",
                              style: Theme.of(context).textTheme.headline1),
                          Text(r"R$ 200,00",
                              style: Theme.of(context).textTheme.headline1),
                          Text("Vencimento: 25/04",
                              style: Theme.of(context).textTheme.headline1),
                          Text("\n___________________",
                              style: Theme.of(context).textTheme.headline1),
                          Text("Limite Disponível: ",
                              style: Theme.of(context).textTheme.headline1),
                          Text(r"R$ 25,00",
                              style: Theme.of(context).textTheme.headline1),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.amber[600],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Card(
              margin: EdgeInsets.all(15),
              color: Theme.of(context).primaryColor,
              child: Container(
                margin: EdgeInsets.all(15),
                height: 30,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Conheça o site da loja!",
                      style: TextStyle(fontSize: 20),
                    ),
                    ElevatedButton(onPressed: () {}, child: Text("Visitar"))
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: CarouselSlider.builder(
                itemCount: lista.length,
                options: CarouselOptions(height: 400.0),
                itemBuilder: (context, index, realIdx) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).primaryColor,
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/alterarSenha');
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 250,
                            child: Image.asset(
                              lista[index],
                            ),
                          ),
                          Text(
                            r"de R$ 99,90",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            r"Por R$ 59,90",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

class ItemMenu extends StatelessWidget {
  final String texto;
  final IconData icone;
  final String rota;

  const ItemMenu({Key key, this.texto, this.icone, this.rota})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        onTap: () {
          Navigator.pushNamed(context, rota);
        },
        leading: Icon(icone),
        title: Text(
          texto,
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
