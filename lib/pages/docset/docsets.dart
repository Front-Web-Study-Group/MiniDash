import 'package:flutter/material.dart';
import 'package:mini_dash/application.dart';
import 'package:mini_dash/components/header.dart';
import 'package:mini_dash/models/Demo.dart';
import 'package:mini_dash/models/docset/docset_model.dart';
import 'package:mini_dash/pages/demo/http.dart';
import 'package:mini_dash/routers/navigator_utils.dart';
import 'package:mini_dash/routers/router_info.dart';
import 'package:mini_dash/utils/constants.dart';
import 'package:provider/provider.dart';

class Bookshelf extends StatelessWidget {
  Bookshelf() {
    Application.docsetModel.loadDocset();
  }

  Future<int> renderFloatingBtn(BuildContext context) {
    return showModalBottomSheet<int>(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: ListView.builder(
            itemCount: demoConfigList.length,
            shrinkWrap: true, // 自适应高都
            itemBuilder: (BuildContext context, int index) => GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HttpTestRoute(),
                    ),
                  );
                },
                child: Text(
                  demoConfigList[index].name,
                )),
          ),
        );
      },
    );
  }

  renderTips() {
    return Center(
        heightFactor: 10,
        child: Text('未读取到文档，请先去下载',
            style: TextStyle(fontSize: 18), textAlign: TextAlign.center));
  }

  @override
  Widget build(BuildContext context) {
    var downloadRepoData = context.watch<DocsetModel>().downloadRepoData;

    return Scaffold(
        appBar: Header(),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            int type = await renderFloatingBtn(context);
            print(type);
          },
          tooltip: 'Increment',
          child: Icon(Icons.ac_unit_sharp),
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            top: 20,
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
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                                textAlign: TextAlign.center),
                            onPressed: () => NavigatorUtils.push(
                                context, RouterConst.docset,
                                arguments: repo)),
                      ),
                    );
                  }),
        ));
  }
}
