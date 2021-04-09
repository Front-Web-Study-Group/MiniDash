import 'package:flutter/material.dart';
import 'package:mini_dash/constants.dart';
import 'package:mini_dash/components/header.dart';
import 'package:mini_dash/models/User.dart';
import 'package:mini_dash/screens/user/component/user_card.dart';
import 'package:mini_dash/screens/user/login_screen.dart';

class UserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          color: kPrimaryColor,
          child: Header(
            route: 'user',
          ),
        ),
        Expanded(
            child: Expanded(
          child: ListView.builder(
            itemCount: userConfigList.length,
            itemBuilder: (context, index) => UserCard(
              document: userConfigList[index],
              press: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
              ),
            ),
          ),
        ))
      ],
    ));
  }
}
