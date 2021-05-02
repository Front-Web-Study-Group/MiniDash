import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:mini_dash/models/docset/docset.dart';

import './repo.dart';
import './repo_configs.dart';

class Repos {
  List<Repo> repoData = repoConfigs;

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
  }
}

var repos = Repos();
