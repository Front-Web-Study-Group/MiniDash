import 'package:flutter/material.dart';

class SetupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("设置"),
      ),
      body: Column(
        children: [
          Expanded(
              child: Column(
            children: [Text('SetupScreen')],
          ))
        ],
      ),
    );
  }
}
