import 'package:flutter/material.dart';
import 'package:mini_dash/components/tool_box.dart';
import 'package:mini_dash/screens/home/components/search_box.dart';

import '../constants.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(bottom: kDefaultPadding),
      child: Positioned(
        top: 0,
        left: 0,
        right: 0,
        child: Container(
          margin: EdgeInsets.only(right: kDefaultPadding / 4),
          color: kPrimaryColor.withOpacity(0.2),
          child: Stack(
            children: [
              SearchBox(size: size),
              ToolBox(),
            ],
          ),
        ),
      ),
    );
  }
}
