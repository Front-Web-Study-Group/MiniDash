import 'package:flutter/material.dart';
import 'package:mini_dash/constants.dart';
import 'package:mini_dash/components/header.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: kPrimaryColor,
            child: Header(
              route: 'search',
            ),
          ),
          Expanded(
              child: Column(
            children: [Text('SearchScreen')],
          ))
        ],
      ),
    );
  }
}
