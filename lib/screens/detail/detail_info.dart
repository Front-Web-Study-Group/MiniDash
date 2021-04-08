import 'package:flutter/material.dart';
import 'package:mini_dash/components/card_info.dart';
import 'package:mini_dash/constants.dart';
import 'package:mini_dash/components/header.dart';

class DetailInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        body: Column(
          children: [
            Container(
              color: kPrimaryColor,
              child: Header(
                route: 'detail',
              ),
            ),
            Expanded(
                child: Column(
              children: [CardInfo()],
            ))
          ],
        ),
      ),
    );
  }
}
