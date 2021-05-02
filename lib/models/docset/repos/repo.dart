import 'dart:io';

import 'package:mini_dash/utils/constants.dart';
import 'package:xml/xml.dart';
import 'package:mini_dash/models/docset/docset.dart';
import 'package:path/path.dart' as path;

class RepoLocal {
  String name;
  String version;
  RepoLocal([this.name, this.version]);
}

class Repo {
  final String feed, icon;
  final List<String> alias;
  final String detailString = "";

  String feedURL;
  String platform;
  String dVersion;
  String version;
  String docsetName;
  bool isCustom = false;
  bool isDownload = false;
  bool hasOtherVersion = false;
  List<String> urls;

  Repo({
    this.feed,
    this.icon,
    this.alias,
  }) {
    this.feedURL = FEED_BASE_URL + this.feed;
    if (feed == "SproutCore.xml") {
      this.isCustom = true;
      this.feedURL = FEED_BASE_URL_SPROUTCORE + this.feed;
    }
    this.docsetName = this.feed.split('.').first;
  }

  parseXML(xml) {
    var xmlDoc = XmlDocument.parse(xml);
    var root = xmlDoc.firstChild;

    this.urls = root.findElements('url').map((node) => node.text).toList();
    this.version = root.findElements('version').first.text.replaceAll('/', '.');
    this.hasOtherVersion = root.findElements('other-versions').length != 0;
  }

  get name {
    var docsetName = this.docsetName.replaceAll('_', '').trim();
    if (docsetName == "NET Framework") {
      docsetName = ".NET Framework";
    } else if (docsetName == "Angular.dart") {
      docsetName = "AngularDart";
    } else if (docsetName == "MatPlotLib") {
      docsetName = "Matplotlib";
    } else if (docsetName == "Lo-Dash") {
      docsetName = "Lodash";
    }

    if (isDownload && dVersion != null && platform != "cheatsheet") {
      docsetName += "-$dVersion";
    }
    return docsetName;
  }

  bool isCanInstall() {
    if (this.docsetName == "DOM") {
      return false;
    }
    return true;
  }

  // 下载/解压名字都把版本带上
  String getName(String fName) {
    if (!this.hasOtherVersion) {
      return fName;
    }
    return Docset.getDocsetName(fName, this.version);
  }

  Future<String> getDownloadPath(String url) async {
    var fName = url.split('/').last;
    var name = getName(fName);

    var downloadPath = await Docset.getDownloadPath();
    return path.join(downloadPath, DOCSETS_PATH, name);
  }

  Future<String> getStorePath() async {
    var storePath = await Docset.getStorePath();
    return path.join(storePath, this.docsetName);
  }

  Future<bool> deleteDocset() async {
    var storePath = await getStorePath();
    var directory = Directory(storePath);
    if (directory.existsSync()) {
      directory.deleteSync(recursive: true);
      isDownload = false;
      return true;
    }
    return false;
  }
}
