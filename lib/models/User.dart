import 'package:flutter/material.dart';
import 'package:mini_dash/screens/user/feedback_screen.dart';
import 'package:mini_dash/screens/user/login_screen.dart';
import 'package:mini_dash/screens/user/theme_screen.dart';
import 'package:mini_dash/screens/user/setup_screen.dart';
import 'package:mini_dash/screens/user/update_screen.dart';

class User {
  final String name, image;
  final Function press;

  User({
    this.name,
    this.image,
    this.press,
  });
}

List userConfigList = [
  User(
    name: "登陆",
    image: "assets/images/image_1.png",
    press: (context) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ),
    ),
  ),
  User(
    name: "反馈",
    image: "assets/images/image_1.png",
    press: (context) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FeedbackScreen(),
      ),
    ),
  ),
  User(
    name: "版本",
    image: "assets/images/image_1.png",
    press: (context) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UpdateScreen(),
      ),
    ),
  ),
  User(
    name: "主题",
    image: "assets/images/image_1.png",
    press: (context) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ThemeScreen(),
      ),
    ),
  ),
  User(
    name: "设置",
    image: "assets/images/image_1.png",
    press: (context) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SetupScreen(),
      ),
    ),
  ),
  User(
    name: "退出",
    image: "assets/images/image_1.png",
    press: (context) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ),
    ),
  ),
];
