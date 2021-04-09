import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CardInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Slidable(
        actionPane: SlidableDrawerActionPane(),
        actionExtentRatio: 0.25,
        child: Container(
            color: Colors.black12,
            // width: context.size.width,
            height: 800,
            child: Scrollbar(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.indigoAccent,
                        child: Text('3'),
                        foregroundColor: Colors.white,
                      ),
                      title: Text('Tile n°3'),
                      subtitle: Text('SlidableDrawerDelegate'),
                    ),
                    // SizedBox(
                    //   child: WebView(
                    //     initialUrl: Uri.dataFromString(
                    //             '<html><body><iframe src="https://www.baidu.com"></iframe></body></html>',
                    //             mimeType: 'text/html')
                    //         .toString(),
                    //     javascriptMode: JavascriptMode.unrestricted,
                    //   ),
                    // ),
                  ],
                ),
              ),
            )),
        actions: <Widget>[
          Column(
            children: [
              Text('API 1'),
              Text('API 2'),
              Text('API 3'),
            ],
          )
        ],
        secondaryActions: <Widget>[
          Column(
            children: [
              Text('Note 1'),
              Text('Note 2'),
              Text('Note 3'),
            ],
          )
        ],
      ),
    );
  }
}
