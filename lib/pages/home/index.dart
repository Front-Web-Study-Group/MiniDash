import 'package:flutter/material.dart';
import 'package:mini_dash/pages/user/index.dart';
import 'package:mini_dash/pages/userData/index.dart';

import '../docset/docsets.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  void _changePage(int index) {
    if (index != currentIndex) {
      setState(() {
        currentIndex = index;
      });
    }
  }

  final List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(label: "首页", icon: Icon(Icons.account_balance)),
    BottomNavigationBarItem(label: "数据", icon: Icon(Icons.dashboard)),
    BottomNavigationBarItem(label: "我的", icon: Icon(Icons.accessible))
  ];

  final pages = [Bookshelf(), UserDataPage(), UserPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[currentIndex],
        bottomNavigationBar: SizedBox(
          height: 100,
          child: BottomNavigationBar(
            fixedColor: Colors.blue[300],
            currentIndex: this.currentIndex,
            items: items,
            onTap: _changePage,
          ),
        ));
  }
}
