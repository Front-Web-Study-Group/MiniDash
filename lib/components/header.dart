import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mini_dash/components/search_box.dart';
import 'package:mini_dash/screens/home/home_screen.dart';

import '../constants.dart';

class Header extends StatelessWidget {
  const Header({
    Key key,
    @required this.route,
  }) : super(key: key);
  final String route;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      child: Positioned(
        top: 0,
        left: 0,
        right: 0,
        child: Container(
          margin: EdgeInsets.only(right: kDefaultPadding / 4),
          color: kPrimaryColor.withOpacity(0.2),
          child: Stack(
            children: [
              SearchBox(size: size, route: route),

              // ToolBox(),
            ],
          ),
        ),
      ),
    );
  }
}
