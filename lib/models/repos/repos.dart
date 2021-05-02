import 'dart:io';
import 'package:path/path.dart' as path;

import './repo.dart';
import './repo_configs.dart';

class Repos {
  List<Repo> repoData = repoConfigs;

  init() async {
    var docsetPath = await DocsetPath.getStorePath();
    var downloadPath = await DocsetPath.getDownloadPath();
    print('docsetPath: $docsetPath');
    print('downloadPath: $downloadPath');

    var directory = Directory(docsetPath);
    List<String> docsetNames = [];
    if (directory.existsSync()) {
      var files = directory.listSync();
      files.forEach((file) {
        var name = path.split(file.path).last;
        if (!['.DS_Store'].contains(name)) {
          docsetNames.add(name);
        }
      });
    }
    if (docsetNames.length > 0) {
      this.repoData = repoData.map((repo) {
        repo.isDownload = docsetNames.contains(repo.docsetName);
        return repo;
      }).toList();
    }
  }
}

var repos = Repos();
