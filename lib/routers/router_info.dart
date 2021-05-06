import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

abstract class IRouterProvider {
  void initRouter(FluroRouter router);

  String getParam(Map<String, List<String>> params, String key) {
    return params[key]?.first;
  }

  T getArgs<T>(BuildContext context) {
    return context.settings.arguments as T;
  }
}

class RouterConst {
  static const home = "/home";
  static const docset = "/docset";
  static const docsetTypes = "/docset/types";
  static const docsetWebview = "/docset/webview";
  static const repos = "/repos";
}
