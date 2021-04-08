import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CardInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: Container(
        color: Colors.white,
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
      actions: <Widget>[
        IconSlideAction(
          caption: 'Archive',
          color: Colors.blue,
          icon: Icons.archive,
          onTap: () => print('Archive'),
        )
      ],
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'More',
          color: Colors.black45,
          icon: Icons.more_horiz,
          onTap: () => print('More'),
        )
      ],
    );
  }
}
