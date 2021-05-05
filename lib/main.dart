import 'package:flutter/material.dart';
import 'package:app_mf_tc/pages/telainicial.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(          
          primarySwatch: Colors.amber,
          accentColor: Colors.amber,
          primaryColor: Colors.blueGrey,
          brightness: Brightness.dark,
          fontFamily: 'Roboto',          
        ),
        
        home: TelaInicial(),
      ),
    );


