import 'package:mini_dash/models/docset/docset_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class Application {
  static const String initRouter = '/index';

  static DocsetModel docsetModel = DocsetModel();

  static List<SingleChildWidget> get providers {
    return [
      ChangeNotifierProvider.value(
        value: docsetModel,
      )
    ];
  }

  static init() {}
}
