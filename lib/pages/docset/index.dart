import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_dash/models/docset/docset.dart';
import 'package:mini_dash/models/docset/docset_model.dart';
import 'package:mini_dash/models/docset/repos/repo.dart';
import 'package:mini_dash/routers/navigator_utils.dart';
import 'package:mini_dash/routers/router_info.dart';
import 'package:provider/provider.dart';

class DocsetPage extends StatefulWidget {
  final Repo repo;
  DocsetPage(this.repo, {Key key}) : super(key: key);

  @override
  _DocsetPageState createState() => _DocsetPageState(this.repo);
}

class _DocsetPageState extends State<DocsetPage> {
  Repo repo;
  Docset docset;

  _DocsetPageState(this.repo);

  openItem(String key, List<SearchItem> values) {
    if (values.length == 1) {
      var item = values.first;
      NavigatorUtils.push(context, RouterConst.docsetWebview, arguments: item);
    } else {
      NavigatorUtils.push(context, RouterConst.docsetTypes,
          arguments: {'title': key, 'list': values});
    }
  }

  @override
  void initState() {
    super.initState();
    context.read<DocsetModel>().parseDocset(repo);
  }

  @override
  Widget build(BuildContext context) {
    var docset = context.watch<DocsetModel>().docset;
    var typeMap = docset?.typeMap;

    return Scaffold(
        appBar: AppBar(
          title: Text(repo.name),
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () => NavigatorUtils.goBack(context),
          ),
        ),
        body: typeMap == null
            ? Center(
                child: Text('正在解析'),
              )
            : ListView.separated(
                itemCount: typeMap.keys.length,
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 0),
                separatorBuilder: (BuildContext context, int index) {
                  return Divider();
                },
                itemBuilder: (context, index) {
                  var key = typeMap.keys.toList()[index];
                  var values = typeMap[key];
                  var length = values.length;

                  return GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      openItem(key, values);
                    },
                    child: Container(
                      height: 40,
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      alignment: Alignment(0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(key,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black)),
                          length > 1
                              ? Text(length.toString(),
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black))
                              : Container(),
                        ],
                      ),
                    ),
                  );
                }));
  }
}
