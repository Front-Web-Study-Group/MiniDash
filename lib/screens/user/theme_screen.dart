import 'package:flutter/material.dart';

class ThemeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("主题"),
      ),
      body: Column(
        children: [
          Expanded(
              child: Column(
            children: [Text('ThemeScreen')],
          ))
        ],
      ),
    );
  }
}
