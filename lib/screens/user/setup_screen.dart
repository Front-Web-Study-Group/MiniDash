import 'package:flutter/material.dart';
import 'package:mini_dash/models/User.dart';
import 'component/user_card.dart';

class SetupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("设置"),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: setupConfigList.length,
            itemBuilder: (context, index) => UserCard(
                document: setupConfigList[index],
                press: () {
                  setupConfigList[index].press(context);
                }),
          ),
        ],
      )),
    );
  }
}
