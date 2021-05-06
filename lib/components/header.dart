import 'package:flutter/material.dart';
import 'package:mini_dash/components/search_box.dart';
import '../utils/constants.dart';

class Header extends StatelessWidget {
  const Header({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              SearchBox(),
            ],
          ),
        ),
      ),
    );
  }
}
