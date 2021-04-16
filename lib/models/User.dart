import 'package:flutter/material.dart';
import 'package:mini_dash/screens/user/component/feedback_detail.dart';
import 'package:mini_dash/screens/user/feedback_screen.dart';
import 'package:mini_dash/screens/user/login_screen.dart';
import 'package:mini_dash/screens/user/theme_screen.dart';
import 'package:mini_dash/screens/user/setup_screen.dart';
import 'package:mini_dash/screens/user/update_screen.dart';

class User {
  final String name;
  final Icon icon;
  final Function press;

  User({
    this.name,
    this.icon,
    this.press,
  });
}

List userConfigList = [
  User(
    name: "登陆",
    icon: Icon(Icons.insert_emoticon_outlined),
    press: (context) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ),
    ),
  ),
  User(
    name: "反馈",
    icon: Icon(Icons.campaign),
    press: (context) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FeedbackScreen(),
      ),
    ),
  ),
  User(
    name: "版本",
    icon: Icon(Icons.pending_actions),
    press: (context) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UpdateScreen(),
      ),
    ),
  ),
  User(
    name: "主题",
    icon: Icon(Icons.settings_input_svideo),
    press: (context) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ThemeScreen(),
      ),
    ),
  ),
  User(
    name: "设置",
    icon: Icon(Icons.build),
    press: (context) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SetupScreen(),
      ),
    ),
  ),
  User(
    name: "退出",
    icon: Icon(Icons.power_settings_new),
    press: (context) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ),
    ),
  ),
];

class FeedbackConfig {
  final String label;
  final List<User> list;

  FeedbackConfig({
    this.label,
    this.list,
  });
}

List feedbackConfigList1 = [
  User(
    name: "反馈1",
    icon: Icon(Icons.insert_emoticon_outlined),
    press: (context) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FeedbackDetail(),
      ),
    ),
  ),
  User(
    name: "反馈2",
    icon: Icon(Icons.campaign),
    press: (context) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FeedbackDetail(),
      ),
    ),
  ),
];

List feedbackConfigList2 = [
  User(
    name: "反馈11",
    icon: Icon(Icons.insert_emoticon_outlined),
    press: (context) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FeedbackDetail(),
      ),
    ),
  ),
  User(
    name: "反馈22",
    icon: Icon(Icons.campaign),
    press: (context) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FeedbackDetail(),
      ),
    ),
  ),
];

List feedbackConfigList3 = [
  User(
    name: "反馈111",
    icon: Icon(Icons.insert_emoticon_outlined),
    press: (context) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FeedbackDetail(),
      ),
    ),
  ),
  User(
    name: "反馈222",
    icon: Icon(Icons.campaign),
    press: (context) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FeedbackDetail(),
      ),
    ),
  ),
];
