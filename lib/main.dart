import 'package:app_mf_tc/screens/telaAlterarSenha.dart';
import 'package:app_mf_tc/screens/telaMinhaFatura.dart';
import 'package:app_mf_tc/screens/telaPerfil.dart';
import 'package:app_mf_tc/screens/telaInfo.dart';
import 'package:app_mf_tc/screens/telaInicial.dart';
import 'package:app_mf_tc/screens/telaLogin.dart';
import 'package:app_mf_tc/screens/telaRecuperarSenha.dart';
import 'package:app_mf_tc/screens/telaRegistrar.dart';
import 'package:flutter/material.dart';
import 'package:app_mf_tc/screens/telaPrincipal.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          hoverColor: Colors.amber,
          primarySwatch: Colors.amber,
          accentColor: Colors.amber,
          primaryColor: Colors.blueGrey[700],
          brightness: Brightness.dark,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              // backgroundColor:
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(color: Colors.amber),
                ),
              ),
            ),
          ),
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
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            //USADO NOS BOTÕES
            headline4: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Colors.blueGrey[900],
            ),
          ),
        ),
        initialRoute: '/inicial',
        routes: {
          '/principal': (context) => TelaPrincipal(),
          '/perfil': (context) => TelaPerfil(),
          '/sobre': (context) => TelaInfo(),
          '/login': (context) => TelaLogin(),
          '/alterarSenha': (context) => AlterarSenha(),
          '/inicial': (context) => TelaInicial(),
          '/minhaFatura': (context) => TelaMinhaFatura(),
          '/recuperarSenha': (context) => TelaLostSenha(),
          '/registrar': (context) => TelaRegister(),
        },
      ),
    );
