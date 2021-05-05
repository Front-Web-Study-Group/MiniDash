import 'package:mini_dash/models/docset/docset_model.dart';
import 'package:mini_dash/routers/router_info.dart';
import 'package:mini_dash/routers/routers.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class Application {
  static const String homeRouter = RouterConst.home;

  static DocsetModel docsetModel = DocsetModel();

  static List<SingleChildWidget> get providers {
    return [
      ChangeNotifierProvider.value(
        value: docsetModel,
      )
    ];
  }

  static init() {
    Routes.initRoutes();
  }
}
