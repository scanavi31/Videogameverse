import 'package:flutter/material.dart';

void main() => runApp(Walinear());

class Walinear extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Align',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Align'),
        ),
        body: Container(
          width: 200,
          height: 200,
          color: Colors.blue,
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: 50,
              height: 50,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
