import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_dash/models/docset/docset.dart';
import 'package:mini_dash/screens/docset/webview.dart';

class DocsetList extends StatelessWidget {
  const DocsetList({Key key, this.title, this.list}) : super(key: key);

  final String title;

  final List<SearchItem> list;

  openItem(BuildContext context, SearchItem value) {
    Navigator.push(
      context,
      MaterialPageRoute(
        // builder: (context) => DocumentInfo(),
        builder: (context) => DocsetWebView(searchItem: value),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
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
