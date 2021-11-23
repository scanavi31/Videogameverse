import 'package:flutter/material.dart';

void main() => runApp(Textos1());

class Textos1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Textos',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Textos'),
        ),
        body: Center(
          child: SizedBox(
              //Envolver en un cada
              width: 400,
              height: 200,
              child: Text(
                'Hola Mundo' * 20,
                textAlign: TextAlign.justify,
                textScaleFactor: 2.6,
                maxLines: 4,
                overflow: TextOverflow.fade, //probar fade, elipsis, visible
                style: TextStyle(
                  fontSize: 40,
                ),
              )),
        ),
      ),
    );
  }
}
