import 'package:flutter/material.dart';
import 'package:mini_dash/models/docset/docsets.dart';
import 'package:mini_dash/utils/constants.dart';
import 'package:mini_dash/screens/document/document_info.dart';
import 'package:provider/provider.dart';

class Bookshelf extends StatelessWidget {
  renderTips() {
    return Center(
        heightFactor: 10,
        child: Text('未读取到文档，请先去下载',
            style: TextStyle(fontSize: 18), textAlign: TextAlign.center));
  }

  @override
  Widget build(BuildContext context) {
    var docsetData = context.watch<Docsets>().docsetData;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: kDefaultPadding / 3,
          right: kDefaultPadding / 3,
        ),
        child: docsetData.length <= 0
            ? renderTips()
            : GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, //横轴三个子widget
                    childAspectRatio: 0.72 //宽高比为1时，子widget
                    ),
                itemCount: docsetData.length,
                itemBuilder: (context, index) {
                  var docset = docsetData[index];

                  return Padding(
                    padding: const EdgeInsets.only(
                        left: kDefaultPadding / 2,
                        right: kDefaultPadding / 2,
                        bottom: kDefaultPadding),
                    child: Container(
                      color: Colors.cyan,
                      child: TextButton(
                        child: Text(docset.name,
                            style: TextStyle(fontSize: 18, color: Colors.white),
                            textAlign: TextAlign.center),
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DocumentInfo(),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
      ),
    );
  }
}
