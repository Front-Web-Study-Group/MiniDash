import 'dart:io';

import 'package:mini_dash/utils/constants.dart';
import 'package:mini_dash/utils/index.dart';
import 'package:path/path.dart' as path;

class Docset {
  static Future<String> getStorePath() async {
    var appPath = await getAppPath();
    return path.join(appPath, DOCSETS_PATH);
  }

  static Future<String> getDownloadPath() async {
    var tempPath = await getTempPath();
    return path.join(tempPath, DOCSETS_PATH);
  }

  static const suffix = '.docset';

  static Docset parseDocsetPath(String docsetPath) {
    var name = path.split(docsetPath).last;
    var dir = Directory(docsetPath);
    var version;
    if (dir.existsSync()) {
      var file = dir.listSync().lastWhere((item) => item.path.endsWith(suffix));
      var fileName = path.split(file.path).last.split(suffix).first;
      var names = fileName.split('-');
      if (names.length > 1) {
        version = names.last;
      }
    }
    return Docset(name, version);
  }

  static String getDocsetName(String fName, String version) {
    var fNames = fName.split('.');
    var name = fNames.first + '-$version';
    var suffix = fNames.last;
    return [name, suffix].join('.');
  }

  String name;
  String version;

  Docset([this.name, this.version]);
}
