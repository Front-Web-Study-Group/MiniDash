import 'package:flutter/material.dart';

import 'package:mini_dash/constants.dart';
import 'package:mini_dash/components/header.dart';

// import 'package:mini_dash/screens/detail/components/detail_card.dart';
import 'package:mini_dash/screens/detail/detail_list.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
          color: kPrimaryColor,
          child: Header(),
        ),
        Expanded(child: DetailList())
      ],
    );
    // return SingleChildScrollView(
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: <Widget>[
    //       Header(),
    //       DetailList()

    //       // DetailDard(size: size),
    //     ],
    //   ),
    // );
  }
}
