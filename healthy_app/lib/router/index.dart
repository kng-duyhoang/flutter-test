import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthy_app/bloc/user_status/userinfor_bloc.dart';

import 'package:healthy_app/screen/home_screen.dart';
import 'package:healthy_app/screen/loading_screen.dart';
import 'package:healthy_app/screen/login_screen.dart';
import 'package:healthy_app/screen/setting_screen.dart';
import 'package:healthy_app/screen/started/index.dart';
import 'package:healthy_app/store/index.dart';
class RouteArg {
  final Map<String, dynamic>? values;
  RouteArg(this.values);
}

class Routes {
  static String homeScreen = '/home';
  static String loginScreen = '/login';
  static String startScreen = '/start';
  static String settingScreen = '/setting';
  static String loadingScreen = '/loading';

  static var routesConfig = {
    homeScreen: (context) => const HomeScreen(),
    loginScreen: (context) => const LoginScreen(),
    startScreen: (context) => BlocProvider(create: (context) => UserInforBloc.instance, child: const StartNavigation()),
    settingScreen: (context) => const SettingScreen(),
    loadingScreen: (context) => const LoadingScreen(),
  };

  static Route<dynamic>? onGenerateRoute(settings) {
    const String rootRoute = "/";
    var  routeName = (settings.name == rootRoute) ? Store.instance.containsKey(StoreKeys.token) ? Routes.loadingScreen : Routes.loginScreen : settings.name;
    // var  routeName = (settings.name == rootRoute) ? Routes.loginScreen : settings.name;
    if (Routes.routesConfig.containsKey(routeName)) {
      return PageRouteBuilder(
        settings: RouteSettings(name: routeName, arguments: settings.arguments),
        pageBuilder: (context, animation, secondaryAnimation) => Routes.routesConfig[routeName]!(context),
        transitionsBuilder: defaultTransition,
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
