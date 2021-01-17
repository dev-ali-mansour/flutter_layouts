import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Material(
        color: Colors.blueAccent,
        child: new Center(
          child: new Text(
            'Welcome to Flutter',
            textDirection: TextDirection.ltr,
            style: new TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.limeAccent),
          ),
        ));
  }
}