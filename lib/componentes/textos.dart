import 'package:flutter/material.dart';

void main() => runApp(Textos());

class Textos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Textos',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Ejemplo Manejo de Textos'),
        ),
        body: Center(
          child: Container(
            child: Column(
              children: [
                Text(
                  'Titulo',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.amberAccent[600],
                  ),
                ),
                Text(
                  'Parrafo' * 30,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: Colors.red[200],
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    decoration: TextDecoration.lineThrough,
                    decorationColor: Colors.amberAccent[600],
                    decorationThickness: 2.5,
                    backgroundColor: Colors.black12,
                  ),
                ),
                Text(
                  'Texto con Decoration 1',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    decorationStyle: TextDecorationStyle.wavy,
                    decorationColor: Colors.red,
                    decorationThickness: 0.5,
                  ),
                ),
                Text(
                  'Texto con familia Roboto',
                  style: TextStyle(
                    fontFamily: 'RobotoMono',
                    fontSize: 20,
                  ),
                ),
                Text.rich(
                  TextSpan(
                    text: 'Hola', // default text style
                    children: <TextSpan>[
                      TextSpan(
                          text: ' Bienvenivdos ',
                          style: TextStyle(fontStyle: FontStyle.italic)),
                      TextSpan(
                          text: 'Todos',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                Text(
                  'Espacios en Letras y Palabras',
                  style: TextStyle(
                    fontFamily: 'RobotoMono',
                    fontSize: 30,
                    letterSpacing: 1,
                    wordSpacing: 1,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
