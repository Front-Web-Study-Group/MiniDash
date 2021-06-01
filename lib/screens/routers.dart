import 'package:fluro/fluro.dart';
import 'package:mini_dash/screens/home/screen.dart';

import '../routers/router_info.dart';

class HomeRouter extends IRouterProvider {
  @override
  void initRouter(FluroRouter router) {
    router.define(RouterConst.home, handler: Handler(handlerFunc: (_, params) {
      return HomeScreen();
    }));
  }
}

final List<IRouterProvider> defaultListRouter = [HomeRouter()];
