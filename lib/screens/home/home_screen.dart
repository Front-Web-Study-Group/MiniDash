import 'package:flutter/material.dart';
import 'package:mini_dash/screens/home/components/body.dart';
import 'package:mini_dash/components/nav_bar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      bottomNavigationBar: NavBar(),
      floatingActionButton: new FloatingActionButton(
        onPressed: () => {},
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    );
  }
}
