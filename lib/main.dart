import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mini_dash/screens/demo/localizations.dart';
import 'package:mini_dash/utils/theme.dart';
import 'package:mini_dash/screens/home/home_screen.dart';
import 'package:bot_toast/bot_toast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()],
      debugShowCheckedModeBanner: false,
      title: 'Plant App',
      theme: lightThemeData(context),
      home: HomeScreen(),
      routes: {
        "/home": (context) => HomeScreen(), //首页
        "/search": (context) => HomeScreen(), //搜索页
        "/user": (context) => HomeScreen(), //用户
        "/detailList": (context) => HomeScreen(), //文档列表页
        "/detailInfo": (context) => HomeScreen(), //文档详情页
      },
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
    );
  }
}
