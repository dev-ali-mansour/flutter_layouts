import 'package:flutter/material.dart';
import 'package:flutter_layouts/ui/first.dart';
import 'package:flutter_layouts/ui/second.dart';
import 'package:flutter_layouts/ui/third.dart';

void main() {
  runApp(new MaterialApp(
    title: "Flutter App"
    // , home: new MyLayout()
    // ,home: new MyHome(),
    ,
    home: First(),
    routes: <String, WidgetBuilder>{
      '/First':(BuildContext context) =>First(),
      '/Second':(BuildContext context) =>Second(),
      '/Third':(BuildContext context) =>Third(''),
    },
  ));
}
