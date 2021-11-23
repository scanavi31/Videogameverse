import 'package:flutter/material.dart';
import 'package:red_egresados/modelos/datospeli.dart';

void main() => runApp(PeliPantalla());

class PeliPantalla extends StatelessWidget {
  final nuevaPeli = peli1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Datos Separados',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Peliculas'),
        ),
        body: Center(
          child: Container(
            child:
                /* ElevatedButton(
                onPressed: () {
                  print(nuevaPeli.titulo);
                  print('Hola');
                },*/
                ListView(
              children: [
                Text(nuevaPeli.titulo),
                Text(nuevaPeli.raiting),
                Text(nuevaPeli.plot),
                Text(nuevaPeli.anno.toString()),
                Text(nuevaPeli.minutos.toString()),
              ],
            ),
          ),
          //child: Text(nuevaPeli.titulo),
          // child: DisArriba(titulo: nuevaPeli.titulo),
          //   DisImagen(nuevaPeli),
          //   DisAbajo(nuevaPeli),
        ),
      ),
    );
  }
}

class DisArriba extends StatelessWidget {
  final titulo;
  const DisArriba({this.titulo});
  @override
  Widget build(BuildContext context) {
    return Text(
      this.titulo,
      style: TextStyle(
        color: Colors.yellow,
        fontSize: 25,
      ),
    );
  }
}
