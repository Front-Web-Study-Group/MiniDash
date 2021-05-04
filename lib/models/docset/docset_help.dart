import 'dart:io';

import 'package:mini_dash/utils/constants.dart';
import 'package:mini_dash/utils/index.dart';
import 'package:path/path.dart' as path;

class DocsetHelp {
  static Future<String> getStorePath() async {
    var appPath = await getAppPath();
    return path.join(appPath, DOCSETS_PATH);
  }

  static Future<String> getDownloadPath() async {
    var tempPath = await getTempPath();
    return path.join(tempPath, DOCSETS_PATH);
  }

  static const suffix = '.docset';

  static DocsetInfo parseDocsetPath(String docsetPath) {
    var name = path.split(docsetPath).last;
    var dir = Directory(docsetPath);
    var version;
    var dPath;
    if (dir.existsSync()) {
      var file = dir.listSync().lastWhere((item) => item.path.endsWith(suffix));
      dPath = file.path;
      var fileName = path.split(dPath).last.split(suffix).first;
      var names = fileName.split('-');
      if (names.length > 1) {
        version = names.last;
      }
    }
    return DocsetInfo(name, dPath, version);
  }

  static String getDocsetName(String fName, String version) {
    var fNames = fName.split('.');
    var name = fNames.first + '-$version';
    var suffix = fNames.last;
    return [name, suffix].join('.');
  }
}

class DocsetInfo {
  String name;
  String version;
  String path;

  DocsetInfo(this.name, this.path, [this.version]);
}
