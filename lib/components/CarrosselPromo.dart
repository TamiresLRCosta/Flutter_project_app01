import 'package:app_mf_tc/components/RedirecionarURL.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarrosselPromo extends StatelessWidget {
  final lista;
  const CarrosselPromo(this.lista);
  @override
  Widget build(BuildContext context) {
    return Container(
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
                redirecionarURL();
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
    );
  }
}
