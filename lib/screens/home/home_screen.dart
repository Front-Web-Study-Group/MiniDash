import 'package:flutter/material.dart';
import 'package:mini_dash/screens/home/components/body.dart';
import 'package:mini_dash/components/nav_bar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<int> _showModalBottomSheet() {
      return showModalBottomSheet<int>(
        context: context,
        builder: (BuildContext context) {
          return ListView.builder(
            itemCount: 30,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text("$index"),
                onTap: () => Navigator.of(context).pop(index),
              );
            },
          );
        },
      );
    }

    return Scaffold(
      body: Body(),
      bottomNavigationBar: NavBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          int type = await _showModalBottomSheet();
          print(type);
        },
        tooltip: 'Increment',
        child: Icon(Icons.ac_unit_sharp),
      ),
    );
  }
}
