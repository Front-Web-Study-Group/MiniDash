import 'package:flutter/material.dart';
import 'package:mini_dash/constants/styles.dart';
import 'package:mini_dash/screens/app/screen.dart';
import 'package:mini_dash/screens/home/components/body.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      drawer: buildDrawer(context),
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: 'Increment',
          backgroundColor: K_PRIMARY_COLOR,
          child: const Icon(
            Icons.book,
            color: Colors.white,
          )),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: Builder(builder: (BuildContext context) {
        return IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            });
      }),
      title: Text('Dash'),
    );
  }

  Drawer buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
              decoration: BoxDecoration(color: K_PRIMARY_COLOR),
              child: Text('UserInfo')),
          ListTile(
            title: Text('数据'),
            trailing: Icon(Icons.dns),
            onTap: () {},
          ),
          ListTile(
            title: Text('关于'),
            trailing: Icon(Icons.info),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AppScreen()));
            },
          )
        ],
      ),
    );
  }
}
