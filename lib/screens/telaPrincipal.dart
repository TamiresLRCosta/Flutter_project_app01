import 'package:app_mf_tc/components/BannerSite.dart';
import 'package:app_mf_tc/components/CardPrincipal.dart';
import 'package:app_mf_tc/components/CarrosselPromo.dart';
import 'package:app_mf_tc/components/Menu.dart';
import 'package:app_mf_tc/components/ConfigAppBar.dart';
import 'package:flutter/material.dart';

class TelaPrincipal extends StatefulWidget {
  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      drawer: Menu(),
      appBar: AppBar(title: ConfigAppBar("Olá, Usuário")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CardPrincipal(),
            BannerSite(),
            CarrosselPromo(),
          ],
        ),
      ),
    );
  }
}
