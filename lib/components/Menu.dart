import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.blueGrey[900],
        child: Column(
          children: [
            //LOGO DO APP
            Container(
              margin: EdgeInsets.all(30),
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
            _ListTileMenu(
              texto: "Adicionar Item Fatura",
              icone: Icons.add,
              rota: "/itemFatura",
            ),
            _ListTileMenu(
              texto: "Adicionar Item Carrossel",
              icone: Icons.add,
              rota: "/itemCarrossel",
            ),
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    _ListTileMenu(
                      texto: "Sair",
                      icone: Icons.logout,
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
  final String? rota;

  const _ListTileMenu({required this.texto, required this.icone, this.rota});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        onTap: () {
          if (rota != null) {
            Navigator.pushNamed(context, rota.toString());
          } else {
            FirebaseAuth.instance.signOut();
            Navigator.pushReplacementNamed(context, '/login');
          }
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
