import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Alertpage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AlertpageState();
  }
}

class AlertpageState extends State<Alertpage> {
  @override
  Widget build(Object context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(color: Colors.amber),
          ),
        ],
        ),
    );
  }
}
