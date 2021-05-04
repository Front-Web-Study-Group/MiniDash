import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mini_dash/models/docset/repos/repo.dart';
import 'package:mini_dash/models/docset/repos/repo_configs.dart';
import 'package:path/path.dart' as path;

import 'docset.dart';
import 'docset_help.dart';

class DocsetModel with ChangeNotifier {
  List<Repo> repoData = repoConfigs;

  bool isInit = false;

  Docset docset;

  DocsetModel();

  parseDocset(repo) async {
    if (this.docset?.repo != repo) {
      this.docset = Docset(repo);
      await this.docset.init();
      notifyListeners();
    }
  }

  List<Repo> get downloadRepoData =>
      this.repoData.where((repo) => repo.isDownload).toList();

  forceUpdate() {
    notifyListeners();
  }

  loadDocset() async {
    var docsetPath = await DocsetHelp.getStorePath();
    var downloadPath = await DocsetHelp.getDownloadPath();
    print('docsetPath: $docsetPath');
    print('downloadPath: $downloadPath');

    var directory = Directory(docsetPath);
    List<DocsetInfo> docsets = [];
    if (directory.existsSync()) {
      var files = directory.listSync();
      files.forEach((file) {
        var name = path.split(file.path).last;
        if (!['.DS_Store'].contains(name)) {
          docsets.add(DocsetHelp.parseDocsetPath(file.path));
        }
      });
    }
    if (docsets.length > 0) {
      this.repoData = repoData.map((repo) {
        var docsetInfo = docsets.singleWhere(
            (docset) => docset.name == repo.docsetName,
            orElse: () => null);
        if (docsetInfo != null) {
          // 直接修改状态
          repo.isDownload = true;
          repo.dPath = docsetInfo.path;
          repo.dVersion = docsetInfo.version;
        }
        return repo;
      }).toList();
    }
    isInit = true;
    notifyListeners();
  }
}
