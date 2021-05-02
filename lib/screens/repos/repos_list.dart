import 'package:flutter/material.dart';
import 'package:mini_dash/models/repos/repos.dart';
import './components/repo_download.dart';

class ReposScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var repoList = repos.repoData;
    return Scaffold(
      appBar: AppBar(title: Text("Docsets")),
      body: Column(children: [
        Expanded(
            child: ListView.separated(
                itemCount: repoList.length,
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 0),
                separatorBuilder: (BuildContext context, int index) {
                  return Divider();
                },
                itemBuilder: (context, index) {
                  var item = repoList[index];
                  return Container(
                    height: 40,
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    alignment: Alignment(0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(item.name,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black)),
                        DownloadBtn(item),
                      ],
                    ),
                  );
                }))
      ]),
    );
  }
}
