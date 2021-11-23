import 'package:flutter/material.dart';

void main() => runApp(Contador());

class Contador extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Stateful Clicker Counter',
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
              'Aumentar - Reiniciar - Disminuir:',
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _incrementCounter('Aumentar');
        },
        tooltip: 'Aumentar',
        child: Icon(Icons.add),
      ),
    );
  }
}
