import 'package:flutter/material.dart';
import 'package:mini_dash/utils/constants.dart';
import 'package:mini_dash/models/Demo.dart';
import 'package:mini_dash/screens/demo/http.dart';
import 'package:mini_dash/components/nav_bar.dart';

import 'components/body.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<int> _showModalBottomSheet() {
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
