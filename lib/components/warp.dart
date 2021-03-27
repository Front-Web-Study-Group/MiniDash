import 'package:flutter/material.dart';

import 'package:mini_dash/constants.dart';
import '../constants.dart';

class Warp extends StatelessWidget {
  const Warp({Key key, @required this.size, @required this.widgets})
      : super(key: key);
  final Size size;
  final Widget widgets;

  @override
  Widget build(BuildContext context) {
    return Container(
        // margin: EdgeInsets.only(top: kDefaultPadding * 2.5),
        height: 50,
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          height: 54,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 10),
                blurRadius: 50,
                color: kPrimaryColor.withOpacity(0.23),
              ),
            ],
          ),
          child: Row(
            children: <Widget>[widgets],
          ),
        ));
  }
}
