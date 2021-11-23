import 'package:flutter/material.dart';

void main() => runApp(Contador1());

class Contador1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejemplo state',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Ejemplo StatefulW Contador'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final title;
  MyHomePage({this.title});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter(String estado) {
    setState(() {
      estado == 'Aumentar' ? _counter++ : _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Aumentar - Reiniciar - Disminuir: Permitir -10 a 10',
            ),
            Text(
              '$_counter',
              style: TextStyle(fontSize: 25),
            ),
            ElevatedButton(
              onPressed: () {
                _incrementCounter('Reiniciar');
              },
              child: Text('Reiniciar Contador'),
            ),
          ],
        ),
      ),

//iconos : https://api.flutter.dev/flutter/material/Icons-class.html

// Aumentar - Disminuir - Reiniciar en un rango de -10 a 10 , Modificar Iconos

      persistentFooterButtons: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          ElevatedButton(onPressed: () {}, child: Icon(Icons.access_time)),
          ElevatedButton(onPressed: () {}, child: Icon(Icons.access_time)),
          ElevatedButton(onPressed: () {}, child: Icon(Icons.access_time)),
        ]),
      ],
    );
  }
}
