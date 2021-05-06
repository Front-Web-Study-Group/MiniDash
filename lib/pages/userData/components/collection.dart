import 'package:flutter/material.dart';
import 'package:mini_dash/pages/document/document_screen.dart';

class Collectio extends StatelessWidget {
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
