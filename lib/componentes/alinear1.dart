import 'package:flutter/material.dart';

void main() => runApp(Alinear1());

class Alinear1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Aplicacion de Filas y Columnas'),
          ),
          body: ListView(
            children: [
              Mensajes(),
              SizedBox(height: 10),
              Mensajes(),
              SizedBox(height: 10),
              Mensajes(),
              SizedBox(height: 10),
              Mensajes(),
            ],
          )

          /*Padding(
          padding: EdgeInsets.all(15.0),
          child: Mensajes(),
        ),*/
          ),
    );
  }
}

class Mensajes extends StatelessWidget {
  const Mensajes({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Imagen a la Izquierda
        CircleAvatar(
          backgroundImage: NetworkImage(
              'https://noverbal.es/uploads/blog/rostro-de-un-criminal.jpg'),
        ),
        // Numero y Mensaje en un columna
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '301 714 34 96',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'Hola Alex ...',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ]),
          ),
        ),

        // Hora y pendientes de leer en una columna
        Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              '12:00',
              style: TextStyle(
                color: Colors.green[700],
              ),
            ),
            CircleAvatar(
              child: Text(
                '8',
                style: TextStyle(fontSize: 12.0),
              ),
              radius: 10.0,
              backgroundColor: Colors.green[700],
            )
          ],
        ),
      ],
    );
  }
}
