import 'dart:io';
import 'package:dio/dio.dart';
import 'package:mini_dash/utils/constants.dart';
import 'package:mini_dash/utils/index.dart';
import 'package:mini_dash/api/dash.dart';
import 'package:xml/xml.dart';
import 'package:archive/archive.dart';
import 'package:path/path.dart' as path;

class RepoDownload {
  static RepoDownload get instance => _getInstance();

  static RepoDownload _instance;

  static _getInstance() {
    if (_instance == null) {
      _instance = RepoDownload._internal();
    }
    return _instance;
  }

  factory RepoDownload() => _getInstance();

  String docsetsPath = '/docsets';

  Future<String> getStorePath([String cPath = ""]) async {
    var appPath = await getAppPath();
    return path.join(appPath, docsetsPath, cPath);
  }

  Future<String> getDownloadPath([String cPath = ""]) async {
    var tempPath = await getTempPath();
    return path.join(tempPath, docsetsPath, cPath);
  }

  RepoDownload._internal();

  unPack(String file) async {
    final bytes = File(file).readAsBytesSync();
    final Archive archive =
        new TarDecoder().decodeBytes(GZipDecoder().decodeBytes(bytes));
    final dPath = await getStorePath();

    for (final file in archive) {
      final filename = file.name;
      if (file.isFile) {
        final data = file.content as List<int>;
        File(dPath + filename)
          ..createSync(recursive: true)
          ..writeAsBytesSync(data);
      } else {
        Directory(dPath + filename)..create(recursive: true);
      }
    }
  }

  download(String url, String name, {Function onReceiveProgress}) async {
    await dashApi.download(url, name,
        onReceiveProgress: (receivedBytes, totalBytes) {
      if (onReceiveProgress != null) {
        var progress = (receivedBytes / totalBytes);
        onReceiveProgress(progress, receivedBytes, totalBytes);
      }
      // 超时时间为1小时
    }, options: Options(receiveTimeout: 3600000));
  }

  downloads(RepoXml repoXml, {Function onReceiveProgress}) async {
    var urls = repoXml.urls;
    for (var url in urls) {
      var file = await getDownloadPath(url.split('/').last);
      try {
        var isExist = File(file).existsSync();
        if (!isExist) {
          await download(url, file, onReceiveProgress: onReceiveProgress);
        }
      } catch (e) {
        continue;
      }
      await unPack(file);
      break;
    }
  }
}

class RepoXml {
  List<String> urls;
  String version;
  bool noVersion;

  RepoXml(String xml) {
    var xmlDoc = XmlDocument.parse(xml);
    var root = xmlDoc.firstChild;

    this.urls = root.findElements('url').map((node) => node.text).toList();
    this.version = root.findElements('version').first.text;
    this.noVersion = root.findElements('other-versions').length == 0;
  }
}

class Repo {
  final String feed, icon;
  final List<String> alias;
  final bool noVersion;
  final String detailString = "";

  String name;
  String feedURL;
  bool isCustom = false;
  String platform;
  bool isDownload = false;
  String version;

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
    this._setName();
  }

  _setName() {
    var docsetName =
        this.name ?? this.feed.split('.').first.replaceAll('_', '').trim();
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
}

List repoData = [
  Repo(
    feed: "Bash.xml",
    icon: "bash",
    alias: ["bash shell", "terminal"],
    noVersion: true,
  ),
  Repo(
    feed: "Lo-Dash.xml",
    icon: "lodash",
    alias: ["lodash"],
    noVersion: false,
  ),
  Repo(
    feed: "MySQL.xml",
    icon: "mysql",
    noVersion: false,
  ),
];
