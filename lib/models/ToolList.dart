import 'package:flutter/material.dart';

class ToolConfig {
  final String name, image;
  final Function press;
  final BuildContext context;

  ToolConfig({this.name, this.image, this.press, this.context});
}

List toolConfigList = [
  ToolConfig(
      image: "assets/icons/help.svg",
      press: (context) async {
        int type = await _showHelpPanel(contexts: context);
        print(type);
      }),
  ToolConfig(
      image: "assets/icons/setup.svg",
      press: (context) async {
        bool type = await _showSetupPanel(contexts: context);
        print(type);
      }),
  ToolConfig(
      image: "assets/icons/upload.svg",
      press: (context) async {
        int type = await _showUploadPanel(contexts: context);
        print(type);
      }),
  ToolConfig(
      image: "assets/icons/collect.svg",
      press: (context) async {
        int type = await _showCollectPanel(contexts: context);
        print(type);
      }),
  ToolConfig(
      image: "assets/icons/info.svg",
      press: (context) async {
        int type = await _showInfoPanel(contexts: context);
        print(type);
      }),
  ToolConfig(
      image: "assets/icons/calendar.svg",
      press: (context) async {
        DateTime type = await _showCalendarPanel(contexts: context);
        print(type);
      }),
];

// 帮助
Future<int> _showHelpPanel({contexts}) {
  BuildContext context = contexts;
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("帮助"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CircularProgressIndicator(),
          ],
        ),
      );
    },
  );
}

// 设置
class StatefulBuilder extends StatefulWidget {
  const StatefulBuilder({
    Key key,
    @required this.builder,
  })  : assert(builder != null),
        super(key: key);

  final StatefulWidgetBuilder builder;

  @override
  _StatefulBuilderState createState() => _StatefulBuilderState();
}

class _StatefulBuilderState extends State<StatefulBuilder> {
  @override
  Widget build(BuildContext context) => widget.builder(context, setState);
}

Future<bool> _showSetupPanel({contexts}) {
  bool _withTree = false; //记录复选框是否选中
  BuildContext context = contexts;

  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("设置"),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("您确定要删除当前文件吗?"),
            Row(
              children: <Widget>[
                Text("同时删除子目录？"),
                // 通过Builder来获得构建Checkbox的`context`，
                // 这是一种常用的缩小`context`范围的方式
                Builder(
                  builder: (BuildContext context) {
                    return Checkbox(
                      value: _withTree,
                      onChanged: (bool value) {
                        (context as Element).markNeedsBuild();
                        _withTree = !_withTree;
                      },
                    );
                  },
                ),
              ],
            ),
          ],
        ),
        actions: <Widget>[
          FlatButton(
            child: Text("取消"),
            onPressed: () => Navigator.of(context).pop(),
          ),
          FlatButton(
            child: Text("删除"),
            onPressed: () {
              // 将选中状态返回
              Navigator.of(context).pop(_withTree);
            },
          ),
        ],
      );
    },
  );
}

// 上传
Future<int> _showUploadPanel({contexts}) {
  BuildContext context = contexts;
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("上传"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CircularProgressIndicator(),
          ],
        ),
      );
    },
  );
}

// 收藏
Future<int> _showCollectPanel({contexts}) {
  BuildContext context = contexts;
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("收藏"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CircularProgressIndicator(),
          ],
        ),
      );
    },
  );
}

// 信息
Future<int> _showInfoPanel({contexts}) {
  BuildContext context = contexts;
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("信息"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CircularProgressIndicator(),
          ],
        ),
      );
    },
  );
}

// 日期
Future<DateTime> _showCalendarPanel({contexts}) {
  BuildContext context = contexts;
  var date = DateTime.now();
  return showDatePicker(
    context: context,
    initialDate: date,
    firstDate: date,
    lastDate: date.add(
      //未来30天可选
      Duration(days: 30),
    ),
  );
}
