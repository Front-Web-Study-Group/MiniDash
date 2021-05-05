import 'package:flutter/material.dart';
import 'package:mini_dash/routers/navigator_utils.dart';
import 'package:mini_dash/routers/router_info.dart';
import 'package:mini_dash/screens/user/user_screen.dart';
import 'package:mini_dash/screens/userData/user_data_screen.dart';
import '../utils/constants.dart';

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
              icon: Icon(Icons.account_balance),
              onPressed: () => NavigatorUtils.push(context, RouterConst.home)),
          IconButton(
            icon: Icon(Icons.dashboard),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UserDataScreen(),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.accessible),
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
