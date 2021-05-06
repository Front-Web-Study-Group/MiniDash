import 'package:fluro/fluro.dart';
import 'package:mini_dash/models/docset/docset.dart';
import 'package:mini_dash/models/docset/repos/repo.dart';
import 'package:mini_dash/pages/docset/webview.dart';
import 'package:mini_dash/pages/home/index.dart';
import 'package:mini_dash/pages/docset/index.dart';
import 'package:mini_dash/pages/repos/index.dart';

import 'docset/types.dart';

import '../routers/router_info.dart';

class HomeRouter extends IRouterProvider {
  @override
  void initRouter(FluroRouter router) {
    router.define(RouterConst.home, handler: Handler(handlerFunc: (_, params) {
      return HomePage();
    }));
  }
}

class DocsetRouter extends IRouterProvider {
  @override
  void initRouter(FluroRouter router) {
    router.define(RouterConst.docset,
        handler: Handler(handlerFunc: (context, params) {
      var repo = getArgs<Repo>(context);
      return DocsetPage(repo);
    }));
  }
}

class DocsetTypesRouter extends IRouterProvider {
  @override
  void initRouter(FluroRouter router) {
    router.define(RouterConst.docsetTypes,
        handler: Handler(handlerFunc: (context, params) {
      var args = getArgs(context);
      return DocsetTypesPage(
        title: args['title'],
        list: args['list'],
      );
    }));
  }
}

class DocsetWebviewRouter extends IRouterProvider {
  @override
  void initRouter(FluroRouter router) {
    router.define(RouterConst.docsetWebview,
        handler: Handler(handlerFunc: (context, params) {
      var searchItem = getArgs<SearchItem>(context);
      return DocsetWebviewPage(searchItem);
    }));
  }
}

class ReposRouter extends IRouterProvider {
  @override
  void initRouter(FluroRouter router) {
    router.define(RouterConst.repos,
        handler: Handler(handlerFunc: (context, params) {
      return ReposPage();
    }));
  }
}

final List<IRouterProvider> listRouter = [
  HomeRouter(),
  DocsetRouter(),
  DocsetTypesRouter(),
  DocsetWebviewRouter(),
  ReposRouter()
];
