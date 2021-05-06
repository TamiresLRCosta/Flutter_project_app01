import 'package:app_mf_tc/components/RedirecionarURL.dart';
import 'package:flutter/material.dart';

class BannerSite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
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
            ElevatedButton(
                onPressed: () {
                  redirecionarURL();
                },
                child: Text("Visitar"))
          ],
        ),
      ),
    );
  }
}
