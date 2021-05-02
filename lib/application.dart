import 'package:flutter/cupertino.dart';
import 'package:mini_dash/models/repos/repos.dart';

class Application {
  static const String initRouter = '/index';

  static init() {
    WidgetsFlutterBinding.ensureInitialized();

    repos.init();
  }
}
