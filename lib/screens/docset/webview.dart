import 'package:flutter/material.dart';
import 'package:mini_dash/models/docset/docset.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:flutter/cupertino.dart';

class DocsetWebView extends StatelessWidget {
  const DocsetWebView({Key key, this.searchItem}) : super(key: key);

  final SearchItem searchItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(searchItem.type),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      // 边距要想办法从里面调整，外面会导致滚动条有问题
      body: WebView(initialUrl: Uri.file(searchItem.path).toString()),
    );
  }
}
