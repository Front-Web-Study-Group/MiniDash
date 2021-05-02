import 'dart:io';

import 'package:mini_dash/utils/constants.dart';
import 'package:mini_dash/utils/index.dart';
import 'package:xml/xml.dart';
import 'package:path/path.dart' as path;

class DocsetPath {
  static Future<String> getStorePath() async {
    var appPath = await getAppPath();
    return path.join(appPath, DOCSETS_PATH);
  }

  static Future<String> getDownloadPath() async {
    var tempPath = await getTempPath();
    return path.join(tempPath, DOCSETS_PATH);
  }
}

String getDocsetName(String fName, String version) {
  var fNames = fName.split('.');
  var name = fNames.first + '-$version';
  var suffix = fNames.last;
  return [name, suffix].join('.');
}

class Repo {
  final String feed, icon;
  final List<String> alias;
  final String detailString = "";

  String name;
  String feedURL;
  String platform;
  String version;
  String docsetName;
  bool isCustom = false;
  bool isDownload = false;
  bool noVersion = false;
  List<String> urls;

  Repo({
    this.name,
    this.feed,
    this.icon,
    this.alias,
    this.noVersion,
  }) {
    this.feedURL = FEED_BASE_URL + this.feed;
    if (feed == "SproutCore.xml") {
      this.isCustom = true;
      this.feedURL = FEED_BASE_URL_SPROUTCORE + this.feed;
    }
    this.docsetName = this.feed.split('.').first;
    this._setName();
  }

  parseXML(xml) {
    var xmlDoc = XmlDocument.parse(xml);
    var root = xmlDoc.firstChild;

    this.urls = root.findElements('url').map((node) => node.text).toList();
    this.version = root.findElements('version').first.text.replaceAll('/', '-');
    this.noVersion = root.findElements('other-versions').length == 0;
  }

  _setName() {
    var docsetName = this.name ?? this.docsetName.replaceAll('_', '').trim();
    if (docsetName == "NET Framework") {
      docsetName = ".NET Framework";
    } else if (docsetName == "Angular.dart") {
      docsetName = "AngularDart";
    } else if (docsetName == "MatPlotLib") {
      docsetName = "Matplotlib";
    } else if (docsetName == "Lo-Dash") {
      docsetName = "Lodash";
    }

    if (isDownload &&
        !noVersion &&
        this.version != null &&
        this.platform != "cheatsheet") {
      docsetName += this.version;
    }
    this.name = docsetName;
  }

  // 下载/解压名字都把版本带上
  String getName(String fName) {
    if (this.noVersion) {
      return fName;
    }
    return getDocsetName(fName, this.version);
  }

  Future<String> getDownloadPath(String url) async {
    var fName = url.split('/').last;
    var name = getName(fName);

    var downloadPath = await DocsetPath.getDownloadPath();
    return path.join(downloadPath, DOCSETS_PATH, name);
  }

  Future<String> getStorePath() async {
    var storePath = await DocsetPath.getStorePath();
    return path.join(storePath, this.docsetName);
  }

  Future<bool> deleteDocset() async {
    var storePath = await getStorePath();
    var directory = Directory(storePath);
    if (directory.existsSync()) {
      directory.deleteSync(recursive: true);
      return true;
    }
    return false;
  }
}
