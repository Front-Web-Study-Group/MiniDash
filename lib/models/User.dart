import 'package:flutter/material.dart';
import 'package:mini_dash/screens/user/component/feedback_detail.dart';
import 'package:mini_dash/screens/user/feedback_screen.dart';
import 'package:mini_dash/screens/user/login_screen.dart';
import 'package:mini_dash/screens/user/setup/clear_cache_screen.dart';
import 'package:mini_dash/screens/user/setup/network_diagnosis_screen.dart';
import 'package:mini_dash/screens/user/setup/theme_screen.dart';
import 'package:mini_dash/screens/user/setup/update_screen.dart';
import 'package:mini_dash/screens/user/setup_screen.dart';

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
      press: (context) async {
        bool type = await _logoutPanel(contexts: context);
        print(type);
      }),
];

// 退出登陆
Future<bool> _logoutPanel({contexts}) {
  BuildContext context = contexts;
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("退出"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("确认退出登陆么？"),
          ],
        ),
        actions: <Widget>[
          FlatButton(
            child: Text("取消"),
            onPressed: () => Navigator.of(context).pop(), //关闭对话框
          ),
          FlatButton(
            child: Text("确认"),
            onPressed: () {
              // ... 执行删除操作
              Navigator.of(context).pop(true); //关闭对话框
            },
          ),
        ],
      );
    },
  );
}

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

List setupConfigList = [
  User(
    name: "设置主题",
    icon: Icon(Icons.settings_input_svideo),
    press: (context) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ThemeScreen(),
      ),
    ),
  ),
  User(
    name: "网络诊断",
    icon: Icon(Icons.insert_emoticon_outlined),
    press: (context) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NetworkDiagnosisScreen(),
      ),
    ),
  ),
  User(
    name: "清除缓存",
    icon: Icon(Icons.campaign),
    press: (context) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ClearCacheScreen(),
      ),
    ),
  ),
  User(
    name: "关于MiniDash",
    icon: Icon(Icons.pending_actions),
    press: (context) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UpdateScreen(),
      ),
    ),
  ),
];
