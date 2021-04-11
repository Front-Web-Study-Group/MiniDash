import 'package:flutter/material.dart';
import 'package:mini_dash/screens/document/document_screen.dart';

class CollectioListScreen extends StatelessWidget {
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
