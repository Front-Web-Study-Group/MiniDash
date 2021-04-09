import 'package:flutter/material.dart';
import 'package:mini_dash/theme.dart';
import 'package:mini_dash/screens/home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Plant App',
        theme: lightThemeData(context),
        home: HomeScreen(),
        routes: {
          "/home": (context) => HomeScreen(), //首页
          "/search": (context) => HomeScreen(), //搜索页
          "/user": (context) => HomeScreen(), //用户
          "/detailList": (context) => HomeScreen(), //文档列表页
          "/detailInfo": (context) => HomeScreen(), //文档详情页
        });
  }
}
