import 'package:flutter/material.dart';
import 'dart:math';

class TransformDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.cyan,
      margin: EdgeInsets.only(top: 10),
      child: Transform(
        alignment: Alignment.topRight,
        transform: Matrix4.skewY(0.3)..rotateZ(-pi / 12.0),
        child: Container(
            color: Colors.yellow,
            padding: const EdgeInsets.all(8.0),
            child: const Text('Apartment for rent!')),
      ),
    );
  }
}

class TransformDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transform演示'),
      ),
      body: Center(child: Column(
        children: <Widget>[
          //
          Text('A widget that applies a transformation before painting its child.'),
          TransformDemo(),
        ],
      ),),
    );
  }
}
