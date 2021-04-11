import 'package:flutter/material.dart';
import 'package:mini_dash/screens/userData/collection_list_screen.dart';
import 'package:mini_dash/screens/userData/note_list_screen.dart';

class UserDataScreen extends StatelessWidget {
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
          title: Text('用户数据中心'),
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: TabBarView(
          children: [
            CollectioListScreen(),
            NoteListScreen(),
          ],
        ),
      ),
    );
  }
}
