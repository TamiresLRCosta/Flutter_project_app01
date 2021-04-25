import 'package:flutter/material.dart';

class TelaInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Sobre nós'),
        backgroundColor: Colors.blueGrey[800],
      ),
      body: Container(
        color: Colors.blueGrey[900],
        padding: EdgeInsets.only(top: 15, left: 30, right: 30, bottom: 15),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 15, left: 30, right: 30, bottom: 15
              ),
            ),
            //icone
            Icon(Icons.lightbulb_outline_rounded,
              size: 150, 
              color: Colors.white70
            ),

            //Texto 'about us'
            SizedBox(height: 50),
            Container(
              margin: EdgeInsets.all(15.0),
              padding:  EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white70),
                borderRadius: BorderRadius.circular(18.0)
              ),
              child: Text('In the beginning God created the heaven and the earth. And the earth was without form, and void; and darkness was upon the face of the deep. And the Spirit of God moved   upon the face of the waters. And God said, Let there be light: and there was light. And God saw the light, that it was good: and God divided the light from the darkness. And God called the light Day, and the darkness he called Night. And the evening and the morning were the first day.',
              textAlign: TextAlign.justify,
              style: TextStyle(fontWeight: FontWeight.w200),
              ),
            ),

            //icons 'contacts'
            //phone
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [                
                Icon(Icons.call, size: 20),
                Text('     (16) 99999-9999'),
              ],
            ),
            
            //email
            SizedBox(height: 10),
              Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [                
                Icon(Icons.email, size: 20),
                Text('     empresa.loja@empresa.com'),
              ],
            ),

              //address
              SizedBox(height: 10),
              Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [                
                Icon(Icons.home, size: 20),
                Text('     Rua Nova York, 1300 - Centro / Ribeirão Preto'),
              ],
            ),
          ],          
        ),
        


      ),
      
    );
  }
}