import 'package:flutter/material.dart';
import 'package:mini_dash/application.dart';
import 'package:mini_dash/components/header.dart';
import 'package:mini_dash/models/docset/docset_model.dart';
import 'package:mini_dash/routers/navigator_utils.dart';
import 'package:mini_dash/routers/router_info.dart';
import 'package:mini_dash/utils/constants.dart';
import 'package:provider/provider.dart';

class Bookshelf extends StatelessWidget {
  renderTips() {
    return Center(
        heightFactor: 10,
        child: Text('未读取到文档，请先去下载',
            style: TextStyle(fontSize: 18), textAlign: TextAlign.center));
  }

  Bookshelf() {
    Application.docsetModel.loadDocset();
  }

  @override
  Widget build(BuildContext context) {
    var downloadRepoData = context.watch<DocsetModel>().downloadRepoData;

    return Column(children: [
      Container(
        color: kPrimaryColor,
        child: Header(),
      ),
      Expanded(
          child: Scaffold(
              body: Padding(
        padding: const EdgeInsets.only(
          left: kDefaultPadding / 3,
          right: kDefaultPadding / 3,
        ),
        child: downloadRepoData.length <= 0
            ? renderTips()
            : GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, //横轴三个子widget
                    childAspectRatio: 0.72 //宽高比为1时，子widget
                    ),
                itemCount: downloadRepoData.length,
                itemBuilder: (context, index) {
                  var repo = downloadRepoData[index];

                  return Padding(
                    padding: const EdgeInsets.only(
                        left: kDefaultPadding / 2,
                        right: kDefaultPadding / 2,
                        bottom: kDefaultPadding),
                    child: Container(
                      color: Colors.cyan,
                      child: TextButton(
                          child: Text(repo.name,
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                              textAlign: TextAlign.center),
                          onPressed: () => NavigatorUtils.push(
                              context, RouterConst.docset,
                              arguments: repo)),
                    ),
                  );
                }),
      )))
    ]);
  }
}
