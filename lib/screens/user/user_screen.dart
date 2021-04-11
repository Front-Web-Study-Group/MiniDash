import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mini_dash/constants.dart';
import 'package:mini_dash/components/header.dart';
import 'package:mini_dash/models/User.dart';
import 'package:mini_dash/screens/user/component/user_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserScreen extends StatelessWidget {
  Future<String> mockNetworkData() async {
    return Future.delayed(Duration(seconds: 2), () => "我是从互联网上获取的数据");
  }

  Stream<int> counter() {
    return Stream.periodic(Duration(seconds: 1), (i) {
      return i;
    });
  }

  _incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int counter = (prefs.getInt('counter') ?? 0) + 1;
    print('Pressed $counter times.');
    await prefs.setInt('counter', counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          color: kPrimaryColor,
          child: Header(
            route: 'user',
          ),
        ),
        IconButton(
          icon: SvgPicture.asset("assets/icons/home.svg"),
          onPressed: _incrementCounter,
        ),
        // Center(
        //   child: FutureBuilder<String>(
        //     future: mockNetworkData(),
        //     builder: (BuildContext context, AsyncSnapshot snapshot) {
        //       // 请求已结束
        //       if (snapshot.connectionState == ConnectionState.done) {
        //         if (snapshot.hasError) {
        //           // 请求失败，显示错误
        //           return Text("Error: ${snapshot.error}");
        //         } else {
        //           // 请求成功，显示数据
        //           return Text("Contents: ${snapshot.data}");
        //         }
        //       } else {
        //         // 请求未结束，显示loading
        //         return CircularProgressIndicator();
        //       }
        //     },
        //   ),
        // ),
        // StreamBuilder<int>(
        //   stream: counter(), //
        //   //initialData: ,// a Stream<int> or null
        //   builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
        //     if (snapshot.hasError) return Text('Error: ${snapshot.error}');
        //     switch (snapshot.connectionState) {
        //       case ConnectionState.none:
        //         return Text('没有Stream');
        //       case ConnectionState.waiting:
        //         return Text('等待数据...');
        //       case ConnectionState.active:
        //         return Text('active: ${snapshot.data}');
        //       case ConnectionState.done:
        //         return Text('Stream已关闭');
        //     }
        //     return null; // unreachable
        //   },
        // ),
        Expanded(
            child: ListView.builder(
          itemCount: userConfigList.length,
          itemBuilder: (context, index) => UserCard(
              document: userConfigList[index],
              press: () {
                userConfigList[index].press(context);
              }),
        ))
      ],
    ));
  }
}
