import 'package:flutter/material.dart';
import 'package:mini_dash/models/docset/docset.dart';
import 'package:mini_dash/routers/navigator_utils.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:flutter/cupertino.dart';

class DocsetWebviewPage extends StatelessWidget {
  const DocsetWebviewPage(this.searchItem, {Key key}) : super(key: key);

  final SearchItem searchItem;

  @override
  Widget build(BuildContext context) {
    var path = searchItem.path;
    var index = path.lastIndexOf('#');
    var htmlPath = path;
    var hash = '';
    if (index != -1) {
      htmlPath = path.substring(0, index);
      // hash 值要单独拿出来，防止被下面 uri 编码转义掉
      hash = path.substring(index);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(searchItem.type),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () => NavigatorUtils.goBack(context),
        ),
      ),
      // 边距要想办法从里面调整，外面会导致滚动条有问题
      body: WebView(initialUrl: Uri.file(htmlPath).toString() + hash),
    );
  }
}
