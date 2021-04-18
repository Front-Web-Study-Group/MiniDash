import 'package:mini_dash/utils/constants.dart';
import 'package:xml/xml.dart';
import './utils.dart';

var dashApi = createApi(FEED_BASE_URL);

Future<List<String>> getDownloadUrls(String name) async {
  var res = await dashApi.get(name);
  var data = res.data.toString();
  var xmlDoc = XmlDocument.parse(data);
  var urls = xmlDoc.findAllElements('url');
  // 提取所有 urls，之后要做循环队列下载
  var values = urls.map((node) => node.text).toList();

  return values;
}
