import 'package:flutter/material.dart';
import 'package:test_app/pages/detail_page.dart';
import 'package:test_app/pages/first_page.dart';

class RouteArg {
  final Map<String, dynamic>? values;

  RouteArg(this.values);
}

class Routes {
  static String firstPage = '/';
  static String homePage = '/home';
  static String settingPage = '/setting';
  static String personalPage = '/personal';
  static String detailPage = '/detail';

  static var routesConfig = {
    firstPage: (context) => const FirstPage(0),
    homePage: (context) => const FirstPage(0),
    settingPage: (context) => const FirstPage(1),
    personalPage: (context) => const FirstPage(2),
    detailPage: (context) => const DetailPage(),
  };
  static Route<dynamic>? onGenerateRoute(settings) {
    const String rootRoute = "/";
    var routeName = (settings.name == rootRoute) ? Routes.homePage : settings.name;
    if (Routes.routesConfig.containsKey(routeName)) {
      return PageRouteBuilder(
        settings: RouteSettings(name: routeName, arguments: settings.arguments),
        pageBuilder: (context, animation, secondaryAnimation) => Routes.routesConfig[routeName]!(context),
        transitionsBuilder: defaultTransition
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
