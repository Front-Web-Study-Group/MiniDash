import 'package:flutter/material.dart';
import 'package:mini_dash/pages/demo/http.dart';
import 'package:mini_dash/pages/user/index.dart';
import 'package:mini_dash/pages/userData/index.dart';
import 'package:mini_dash/utils/constants.dart';
import 'package:mini_dash/models/Demo.dart';

import 'components/bookshelf.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<int> renderFloatingBtn(BuildContext context) {
    return showModalBottomSheet<int>(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: ListView.builder(
            itemCount: demoConfigList.length,
            shrinkWrap: true, // 自适应高都
            itemBuilder: (BuildContext context, int index) => GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HttpTestRoute(),
                    ),
                  );
                },
                child: Text(
                  demoConfigList[index].name,
                )),
          ),
        );
      },
    );
  }

  int currentIndex = 0;

  void _changePage(int index) {
    /*如果点击的导航项不是当前项  切换 */
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
    print(currentIndex);
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.blue[300],
        currentIndex: this.currentIndex,
        items: items,
        onTap: _changePage,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          int type = await renderFloatingBtn(context);
          print(type);
        },
        tooltip: 'Increment',
        child: Icon(Icons.ac_unit_sharp),
      ),
    );
  }
}
