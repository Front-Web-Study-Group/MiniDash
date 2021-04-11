import 'package:flutter/material.dart';
import 'package:mini_dash/screens/demo/file.dart';
import 'package:mini_dash/screens/demo/http.dart';

class Demo {
  final String name, image;
  final Function press;

  Demo({
    this.name,
    this.image,
    this.press,
  });
}

List demoConfigList = [
  Demo(
    name: "http",
    press: (context) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HttpTestRoute(),
      ),
    ),
  ),
  Demo(
    name: "file",
    press: (context) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FileOperationRoute(),
      ),
    ),
  ),
];
