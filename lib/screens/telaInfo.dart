import 'package:app_mf_tc/components/ConfigAppBar.dart';
import 'package:flutter/material.dart';

class TelaInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: ConfigAppBar("Sobre nós")),
      body: Container(
        color: Colors.blueGrey[900],
        child: ListView(
          children: [
            //icone
            Container(
              margin: EdgeInsets.all(20),
              child: Icon(Icons.lightbulb_outline_rounded,
                  size: 120, color: Colors.white70),
            ),

            //Texto 'about us'
            Container(
              margin: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white70),
                  borderRadius: BorderRadius.circular(18.0)),
              child: ListTile(
                title: Text(
                  'In the beginning God created the heaven and the earth. And the earth was without form, and void; and darkness was upon the face of the deep. And the Spirit of God moved   upon the face of the waters. And God said, Let there be light: and there was light. And God saw the light, that it was good: and God divided the light from the darkness. And God called the light Day, and the darkness he called Night. And the evening and the morning were the first day.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontWeight: FontWeight.w200),
                ),
              ),
            ),

            //phone
            ListTile(
              leading: Icon(Icons.call, size: 20),
              title: Text('(16) 99999-9999'),
            ),

            //email
            ListTile(
              leading: Icon(Icons.email, size: 20),
              title: Text('empresa.loga@empresa.com'),
            ),

            //address
            ListTile(
              leading: Icon(Icons.home, size: 20),
              title: Text('Rua Nova York, 1300 - Centro / Ribeirão Preto'),
            ),
          ],
        ),
      ),
    );
  }
}
