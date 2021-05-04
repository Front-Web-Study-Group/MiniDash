import 'package:mini_dash/models/docset/repos/repo.dart';
import 'package:mini_dash/utils/parse_plist.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart';

class Docset {
  Repo repo;

  get contents {
    return path.join(repo.dPath, 'Contents');
  }

  get resources {
    return path.join(contents, 'Resources');
  }

  get dbPath {
    return path.join(resources, 'docSet.dsidx');
  }

  get docPath {
    return path.join(resources, 'Documents');
  }

  String getFullPath(String fPath) {
    return path.join(docPath, fPath);
  }

  ParsePlist getParsePlist() {
    var plistPath = path.join(contents, 'Info.plist');
    var parsePlist = ParsePlist(plistPath);
    return parsePlist;
  }

  SearchItem getMainPage() {
    var parsePlist = getParsePlist();
    var map = parsePlist.toMap();
    var indexPath = map['dashIndexFilePath'] ?? 'index.html';
    return SearchItem(
        path: getFullPath(indexPath), type: 'Main Page', name: 'index');
  }

  Map<String, List<SearchItem>> typeMap;

  Docset(this.repo);

  init() async {
    Database db = await openDatabase(dbPath);
    var data = await db.rawQuery('SELECT * FROM searchIndex');
    this.typeMap = transformTypeMap(data);
  }

  Map<String, List<SearchItem>> transformTypeMap(
      List<Map<String, dynamic>> data) {
    var map = Map<String, List<SearchItem>>();
    var mainPage = getMainPage();
    map[mainPage.type] = [mainPage];
    data.forEach((item) {
      var searchIndex = SearchItem.fromJson(item, getFullPath(item['path']));
      var types = map[searchIndex.type];
      if (types == null) {
        List<SearchItem> tList = [];
        map[searchIndex.type] = tList;
        types = tList;
      }
      types.add(searchIndex);
    });
    return map;
  }
}

class SearchItem {
  int id;
  String name;
  String type;
  String path;

  SearchItem({this.id, this.name, this.path, this.type});

  SearchItem.fromJson(Map map, [String fullPath]) {
    id = map['id'];
    name = map['name'];
    type = map['type'];
    path = fullPath ?? map['path'];
  }
}
