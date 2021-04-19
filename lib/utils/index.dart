import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

Future<bool> confirm(BuildContext context,
    {title = '提示', content = '确认操作？', okText = '确认', cancelText = '取消'}) {
  return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: <Widget>[
              TextButton(
                child: Text(cancelText),
                onPressed: () {
                  Navigator.pop(context, false);
                },
              ),
              TextButton(
                child: Text(okText),
                onPressed: () {
                  Navigator.pop(context, true);
                },
              ),
            ]);
      });
}

Future<String> getAppPath() async {
  final dir = await getApplicationDocumentsDirectory();
  return dir.path;
}

Future<String> getTempPath() async {
  final dir = await getTemporaryDirectory();
  return dir.path;
}
