import 'package:app_mf_tc/pages/telasMatheus/telaAlterarSenha.dart';
import 'package:app_mf_tc/pages/telasMatheus/telaMinhaFatura.dart';
import 'package:app_mf_tc/pages/telasMatheus/telaPerfil.dart';
import 'package:app_mf_tc/pages/telasTamires/telainfo.dart';
import 'package:app_mf_tc/pages/telasTamires/telainicial.dart';
import 'package:app_mf_tc/pages/telasTamires/telalogin.dart';
import 'package:flutter/material.dart';
import 'package:app_mf_tc/pages/telasMatheus/telaPrincipal.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          hoverColor: Colors.amber,
          primarySwatch: Colors.amber,
          accentColor: Colors.amber,
          primaryColor: Colors.blueGrey[700],
          brightness: Brightness.dark,
          //fontFamily: 'Roboto',
          textTheme: TextTheme(
            headline1: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.normal,
              color: Colors.blueGrey[700],
            ),
            headline2: TextStyle(
              fontSize: 25,
              color: Colors.white,
            ),
            //USADO NO TITULO DO APP BAR
            headline3: TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        initialRoute: '/principal',
        routes: {
          '/principal': (context) => TelaPrincipal(),
          '/perfil': (context) => TelaPerfil(),
          '/sobre': (context) => TelaInfo(),
          '/login': (context) => TelaLogin(),
          '/alterarSenha': (context) => AlterarSenha(),
          '/inicial': (context) => TelaInicial(),
          '/minhaFatura': (context) => TelaMinhaFatura(),
        },
      ),
    );
