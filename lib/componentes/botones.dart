import 'package:flutter/material.dart';

void main() => runApp(Botones());

class Botones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Botones'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, //Probar las opciones
            children: [
              //Boton1
              SizedBox(height: 10),
              TextButton(
                onPressed: () {},
                child: Text('Boton 1'),
              ),
              //Boton 2
              SizedBox(height: 10),
              OutlinedButton(
                onPressed: () {},
                child: Text('Boton 2'),
              ),
              //Boton 3
              SizedBox(height: 10),
              OutlinedButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.ac_unit,
                  size: 18,
                ),
                label: Text('Boton 3'),
              ),
              //Boton 4
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Boton 4',
                  style: TextStyle(fontSize: 20),
                ),
              ),

              //Boton 5
              SizedBox(height: 10),
              FloatingActionButton(
                onPressed: () {},
                child: Icon(Icons.accessibility_new),
                elevation: 30.0,
                backgroundColor: Colors.amberAccent[600],
              ),

              //Boton 6

              SizedBox(height: 10),
              ElevatedButton(
                onPressed: null,
                child: Text(
                  'Boton 5',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
