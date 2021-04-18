import 'package:mini_dash/utils/constants.dart';

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
