//Locale资源类
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DLocalizations {
  DLocalizations(this.isZh);
  //是否为中文
  bool isZh = false;
  //为了使用方便，我们定义一个静态方法
  static DLocalizations of(BuildContext context) {
    return Localizations.of<DLocalizations>(context, DLocalizations);
  }

  //Locale相关值，title为应用标题
  String get title {
    return isZh ? "Flutter应用" : "Flutter APP";
  }
  //... 其它的值
}

//Locale代理类
class DLocalizationsDelegate extends LocalizationsDelegate<DLocalizations> {
  const DLocalizationsDelegate();

  //是否支持某个Local
  @override
  bool isSupported(Locale locale) => ['en', 'zh'].contains(locale.languageCode);

  // Flutter会调用此类加载相应的Locale资源类
  @override
  Future<DLocalizations> load(Locale locale) {
    print("$locale");
    return SynchronousFuture<DLocalizations>(
        DLocalizations(locale.languageCode == "zh"));
  }

  @override
  bool shouldReload(DLocalizationsDelegate old) => false;
}
