import 'dart:io';

import 'package:xml/xml.dart';

class ParsePlist {
  String path;
  String xml;
  XmlDocument xmlDoc;

  ParsePlist(this.path) {
    var file = File(this.path);
    if (!file.existsSync()) {
      throw new Exception('File does not exist');
    }
    xml = toXmlString(file);
    xmlDoc = XmlDocument.parse(xml);
  }

  toXmlString(File file) {
    var xml = file.readAsStringSync();
    var index = xml.indexOf('<plist');
    return xml.substring(index);
  }

  dynamic getValue(key, value) {
    if (key == 'true') {
      return true;
    } else if (key == 'false') {
      return false;
    }
    return value;
  }

  Map<String, dynamic> toMap([XmlElement xmlElement]) {
    var element = xmlElement;
    if (xmlElement == null) {
      element = xmlDoc.firstChild.findElements('dict').first;
    }
    Map<String, dynamic> map = {};
    var tempKey;
    element.children.forEach((node) {
      var isEmpty = node is XmlText && node.text.trim().isEmpty;
      if (!isEmpty && node is XmlElement) {
        var key = node.name.local;
        var value = node.text;
        switch (key) {
          case 'key':
            tempKey = value;
            break;
          case 'array':
            map[tempKey] = node.children
                .where((n) => n is XmlElement)
                .map((n) => toMap(n))
                .toList();
            break;
          case 'dict':
            map[tempKey] = toMap(node);
            break;
          case 'string':
          default:
            map[tempKey] = getValue(key, value);
        }
      }
    });
    return map;
  }
}
