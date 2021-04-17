import 'package:flutter/material.dart';
import 'package:mini_dash/components/card_info.dart';
import 'package:mini_dash/components/tool_box.dart';
import 'package:mini_dash/models/ToolList.dart';

class DocumentInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        bottomNavigationBar: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 6, childAspectRatio: 1),
          shrinkWrap: true, // 自适应高都
          itemCount: toolNavbarConfigList.length,
          itemBuilder: (BuildContext context, int index) {
            return IconButton(
                icon: toolNavbarConfigList[index].icon,
                onPressed: () {
                  toolNavbarConfigList[index].press(context);
                });
          },
        ));
  }
}
