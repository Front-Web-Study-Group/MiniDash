import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import './not_found.dart';
import '../pages/routers.dart';

class Routes {
  static final FluroRouter router = FluroRouter();

  static void initRoutes() {
    // 指定路由跳转错误返回页
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      debugPrint('未找到目标页');
      return NotFound();
    });

    // 初始化路由
    listRouter.forEach((routerProvider) {
      routerProvider.initRouter(router);
    });
  }
}
