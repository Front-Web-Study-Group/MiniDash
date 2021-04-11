import 'package:flutter/material.dart';
import 'package:mini_dash/screens/document/document_screen.dart';

class NoteListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Column(
            children: [DocumentScreen()],
          ))
        ],
      ),
    );
  }
}
