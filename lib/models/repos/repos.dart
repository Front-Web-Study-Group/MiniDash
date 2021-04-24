import 'package:mini_dash/utils/constants.dart';
import 'package:xml/xml.dart';

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

  getFolderName() {
    if (!noVersion) {
      return '${this.docsetName}-${this.version}';
    }
    return this.docsetName;
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
