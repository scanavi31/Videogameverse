import 'package:flutter/material.dart';

void main() => runApp(TextosClase());

class TextosClase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Textos'),
        ),
        body: Center(
          child: Container(
            child: Text('Manejo de Textos'),
          ),
        ),
      ),
    );
  }
}
