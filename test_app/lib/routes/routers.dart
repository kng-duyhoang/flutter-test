import 'package:flutter/material.dart';

import 'package:test_app/pages/home_page.dart';
import 'package:test_app/pages/setting_page.dart';

class RouteArg {
  final Map<String, dynamic>? values;

  RouteArg(this.values);
}

class Routes {
  static String homePage = '/pages/home_page.dart';
  static String settingPage = '/pages/setting_page.dart';

  static var routesConfig = {
    homePage: (context) => const HomePage(),
    settingPage: (context) => const SettingPage(),
  };
  static Route<dynamic>? onGenerateRoute(settings) {
    const String rootRoute = "/";
    var routeName = (settings.name == rootRoute) ? Routes.homePage : settings.name;
    if (Routes.routesConfig.containsKey(routeName)) {
      return PageRouteBuilder(
        settings: RouteSettings(name: routeName, arguments: settings.arguments),
        pageBuilder: (context, animation, secondaryAnimation) => Routes.routesConfig[routeName]!(context),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const Offset begin = Offset(0.0, 1.0);
          const end = Offset.zero;
          const curve = Curves.ease;

          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      );
    }

    throw UnsupportedError('Unknown route: $routeName');
  }

  static Widget defaultTransition(context, animation, secondaryAnimation, child) {
    const begin = Offset(0.0, 1.0);
    const end = Offset.zero;
    const curve = Curves.ease;
    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
    return SlideTransition(
      position: animation.drive(tween),
      child: child,
    );
  }

}
