import 'package:flutter/material.dart';

class NoteText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Note 1'),
          Text('Note 2'),
          Text('Note 3'),
        ],
      ),
    );
  }
}
