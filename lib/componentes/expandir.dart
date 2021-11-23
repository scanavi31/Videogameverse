import 'package:flutter/material.dart';

void main() => runApp(Expandir());

class Expandir extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expanded',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Expandir'),
        ),
        body: Center(
            child: Row(children: [
          Expanded(
            flex: 5,
            child: Container(
              height: 100,
              color: Colors.yellow,
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              height: 100,
              color: Colors.blue,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              height: 100,
              color: Colors.red,
            ),
          ),
        ])),
      ),
    );
  }
}
