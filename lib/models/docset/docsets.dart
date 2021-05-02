import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mini_dash/models/docset/repos/repo.dart';
import 'package:mini_dash/models/docset/repos/repo_configs.dart';
import 'package:path/path.dart' as path;

import './docset.dart';

class Docsets with ChangeNotifier {
  List<Repo> repoData = repoConfigs;

  Docsets() {
    this.init();
  }

  List<Repo> get docsetData => this.repoData.where((repo) => repo.isDownload).toList();

  forceUpdate() {
    notifyListeners();
  }

  init() async {
    var docsetPath = await Docset.getStorePath();
    var downloadPath = await Docset.getDownloadPath();
    print('docsetPath: $docsetPath');
    print('downloadPath: $downloadPath');

    var directory = Directory(docsetPath);
    List<Docset> docsets = [];
    if (directory.existsSync()) {
      var files = directory.listSync();
      files.forEach((file) {
        var name = path.split(file.path).last;
        if (!['.DS_Store'].contains(name)) {
          docsets.add(Docset.parseDocsetPath(file.path));
        }
      });
    }
    if (docsets.length > 0) {
      this.repoData = repoData.map((repo) {
        var repoLocal = docsets.singleWhere(
            (docset) => docset.name == repo.docsetName,
            orElse: () => null);
        if (repoLocal != null) {
          repo.isDownload = true;
          repo.dVersion = repoLocal.version;
        }
        return repo;
      }).toList();
    }
    notifyListeners();
  }
}
