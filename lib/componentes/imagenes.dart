import 'package:flutter/material.dart';

void main() => runApp(Imagenes());

class Imagenes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Imagenes'),
        ),
        //Cambiar la columna por una lista
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(15.0),
              child: Image.network(
                  'https://noverbal.es/uploads/blog/rostro-de-un-criminal.jpg'),
            ),
            Container(
              padding: EdgeInsets.all(15.0),
              child: Image.network(
                  'https://noverbal.es/uploads/blog/rostro-de-un-criminal.jpg'),
            ),
            Container(
              padding: EdgeInsets.all(15.0),
              child: Image.network(
                  'https://noverbal.es/uploads/blog/rostro-de-un-criminal.jpg'),
            ),
            Container(
              padding: EdgeInsets.all(15.0),
              child: Image.network(
                  'https://noverbal.es/uploads/blog/rostro-de-un-criminal.jpg'),
            ),
          ],
        ),
      ),
    );
  }
}
