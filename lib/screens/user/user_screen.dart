import 'package:flutter/material.dart';
import 'package:mini_dash/constants.dart';
import 'package:mini_dash/components/header.dart';

class UserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        body: Column(
          children: [
            Container(
              color: kPrimaryColor,
              child: Header(
                route: 'user',
              ),
            ),
            Expanded(
                child: Column(
              children: [Text('UserScreen')],
            ))
          ],
        ),
      ),
    );
  }
}
