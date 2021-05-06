import 'package:flutter/material.dart';
import 'components/collection.dart';
import 'components/note.dart';

class UserDataPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(text: '收藏'),
                Tab(text: '笔记'),
              ],
            ),
            title: Center(
              child: Text(
                '用户数据中心',
              ),
            )
            // leading: IconButton(
            //   icon: Icon(Icons.arrow_back),
            //   onPressed: () => Navigator.of(context).pop(),
            // ),
            ),
        body: TabBarView(
          children: [
            Collectio(),
            Note(),
          ],
        ),
      ),
    );
  }
}
