import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_dash/models/docset/docset.dart';
import 'package:mini_dash/routers/navigator_utils.dart';
import 'package:mini_dash/routers/router_info.dart';

class DocsetTypesPage extends StatelessWidget {
  const DocsetTypesPage({Key key, this.title, this.list}) : super(key: key);

  final String title;

  final List<SearchItem> list;

  openItem(BuildContext context, SearchItem value) {
    NavigatorUtils.push(context, RouterConst.docsetWebview, arguments: value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () => NavigatorUtils.goBack(context),
          ),
        ),
        body: ListView.separated(
            itemCount: list.length,
            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 0),
            separatorBuilder: (BuildContext context, int index) {
              return Divider();
            },
            itemBuilder: (context, index) {
              var value = list[index];

              return GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  openItem(context, value);
                },
                child: Container(
                  height: 40,
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  alignment: Alignment(0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(value.name,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black)),
                    ],
                  ),
                ),
              );
            }));
  }
}
