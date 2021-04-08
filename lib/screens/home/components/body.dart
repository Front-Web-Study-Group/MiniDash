import 'package:flutter/material.dart';
import 'package:mini_dash/constants.dart';
import 'package:mini_dash/components/header.dart';
import 'package:mini_dash/screens/detail/detail_list.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: kPrimaryColor,
          child: Header(
            route: 'home',
          ),
        ),
        Expanded(child: DetailList())
      ],
    );
  }
}