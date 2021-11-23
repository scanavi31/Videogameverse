import 'package:flutter/material.dart';
//import 'package:ejemplo1/clase51.dart';

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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Botones(texto: 'Textos', ruta: (context) => TextosClase()),
              SizedBox(height: 10),
              Botones(texto: 'Botones'),
              SizedBox(height: 10),
              Botones(texto: 'Container'),
              SizedBox(height: 10),
              Botones(texto: 'Container'),
            ],
          ),
        ),
      ),
    );
  }
}

class Botones extends StatelessWidget {
  final texto;
  final ruta;
  const Botones({this.texto, this.ruta});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: this.ruta,
            ));
      },
      child: Text(this.texto),
    );
  }
}
