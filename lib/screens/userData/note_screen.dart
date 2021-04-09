import 'package:flutter/material.dart';

class NoteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Column(
            children: [Text('NoteScreen')],
          ))
        ],
      ),
    );
  }
}
