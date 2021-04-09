import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mini_dash/screens/home/home_screen.dart';
import 'package:mini_dash/screens/user/user_screen.dart';
import 'package:mini_dash/screens/userData/user_data_screen.dart';
import '../constants.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: kDefaultPadding * 2,
        right: kDefaultPadding * 2,
        bottom: kDefaultPadding,
      ),
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -10),
            blurRadius: 35,
            color: kPrimaryColor.withOpacity(0.38),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: SvgPicture.asset("assets/icons/home.svg"),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
            ),
          ),
          IconButton(
            icon: SvgPicture.asset("assets/icons/menu.svg"),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UserDataScreen(),
              ),
            ),
          ),
          IconButton(
            icon: SvgPicture.asset("assets/icons/user.svg"),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UserScreen(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
