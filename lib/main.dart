import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mini_dash/routers/routers.dart';
import 'package:mini_dash/utils/localizations.dart';
import 'package:mini_dash/utils/theme.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:provider/provider.dart';

import 'application.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp() {
    Application.init();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: Application.providers,
        child: MaterialApp(
          builder: BotToastInit(),
          navigatorObservers: [BotToastNavigatorObserver()],
          debugShowCheckedModeBanner: false,
          onGenerateRoute: (RouteSettings routeSettings) {
            // 设置初始路由
            return Routes.router
                .generator(RouteSettings(name: Application.homeRouter));
          },
          theme: lightThemeData(context),
          locale: const Locale('en', 'US'),
          localizationsDelegates: [
            // 本地化的代理类
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            DLocalizationsDelegate()
          ],
          supportedLocales: [
            const Locale('en', 'US'), // 美国英语
            const Locale('zh', 'CN'), // 中文简体
            //其它Locales
          ],
        ));
  }
}
