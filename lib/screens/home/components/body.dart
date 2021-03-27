import 'package:flutter/material.dart';
import 'package:mini_dash/components/header.dart';
import 'package:mini_dash/screens/detail/components/detail_card.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // it enable scrolling on small device
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Header(),
          DetailDard(size: size),
        ],
      ),
    );
  }
}
