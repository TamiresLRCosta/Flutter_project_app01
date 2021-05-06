import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            //LOGO DO APP
            Container(
              margin: EdgeInsets.all(20),
              height: MediaQuery.of(context).size.height * 0.1,
              child: Center(
                child: Image.asset("lib/Imagens/logo.png"),
              ),
            ),
            _ListTileMenu(
              texto: "Perfil",
              icone: Icons.person,
              rota: "/perfil",
            ),
            _ListTileMenu(
              texto: "Sobre",
              icone: Icons.person_outline,
              rota: "/sobre",
            ),
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    _ListTileMenu(
                      texto: "Sair",
                      icone: Icons.logout,
                      rota: "/inicial",
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _ListTileMenu extends StatelessWidget {
  final String texto;
  final IconData icone;
  final String rota;

  const _ListTileMenu({Key key, this.texto, this.icone, this.rota})
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
