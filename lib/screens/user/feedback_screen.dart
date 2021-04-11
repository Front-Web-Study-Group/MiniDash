import 'package:flutter/material.dart';

class FeedbackScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("用户反馈"),
      ),
      body: Column(
        children: [
          Expanded(
              child: Column(
            children: [Text('FeedbackScreen')],
          ))
        ],
      ),
    );
  }
}
