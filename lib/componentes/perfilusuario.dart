import 'package:flutter/material.dart';

void main() => runApp(Perfil());

class Perfil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Mi Perfil'),
          ),
          body: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://d500.epimg.net/cincodias/imagenes/2018/11/13/lifestyle/1542113135_776401_1542116070_noticia_normal.jpg',
                        scale: 20),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
