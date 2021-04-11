import 'package:flutter/material.dart';
import 'package:mini_dash/components/card_info.dart';
import 'package:mini_dash/components/tool_box.dart';

class DocumentInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        body: Column(
          children: [
            // Container(
            //   color: kPrimaryColor,
            //   child: Header(
            //     route: 'document',
            //   ),
            // ),
            Expanded(
              child: DefaultTabController(
                length: 5,
                child: Scaffold(
                  appBar: AppBar(
                    bottom: TabBar(
                      tabs: [
                        Tab(text: 'tab1'),
                        Tab(text: 'tab2'),
                        Tab(text: 'tab3'),
                        Tab(text: 'tab4'),
                        Tab(text: 'tab5'),
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
                      CardInfo(),
                      CardInfo(),
                      CardInfo(),
                      CardInfo(),
                      CardInfo(),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        floatingActionButton: ToolBox(),
      ),
    );
  }
}
