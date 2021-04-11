import 'package:flutter/material.dart';

class UpdateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("版本信息"),
      ),
      body: Column(
        children: [
          Expanded(
              child: Column(
            children: [Text('UpdateScreen')],
          ))
        ],
      ),
    );
  }
}
