import 'package:mini_dash/utils/constants.dart';
import 'package:mini_dash/models/repos.dart';
import './utils.dart';

var dashApi = createApi(FEED_BASE_URL);

Future<RepoXml> getDownloadUrls(String name) async {
  var res = await dashApi.get(name);
  var data = res.data.toString();

  return RepoXml(data);
}
