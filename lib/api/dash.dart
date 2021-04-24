import 'package:mini_dash/utils/constants.dart';
import './utils.dart';

var dashApi = createApi(FEED_BASE_URL);

Future<String> getDownloadUrls(String name) async {
  var res = await dashApi.get(name);
  var data = res.data.toString();

  return data;
}
