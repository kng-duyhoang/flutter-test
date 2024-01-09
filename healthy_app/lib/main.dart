// ignore_for_file: depend_on_referenced_packages, unused_import
// ignore_for_file: must_be_immutable


import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:healthy_app/apis/core_api.dart';
import 'package:healthy_app/bloc/authorize/authorize_bloc.dart';
import 'package:healthy_app/bloc/locale/locale_bloc.dart';
import 'package:healthy_app/bloc/user/user_bloc.dart';
import 'package:healthy_app/router/index.dart';
import 'package:healthy_app/constant/locale.dart';
import 'package:healthy_app/store/index.dart';
import 'package:healthy_app/theme/index.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Store.init();
  await dotenv.load();
  if(!kReleaseMode && !kProfileMode) {
    HttpOverrides.global = MyHttpOverrides();
  }
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LocaleBloc.instance,
        ),
        BlocProvider(
          create: (context) => AuthorizeBloc.instance,
        ),
        BlocProvider(
          create: (context) => UserBloc.instance,
        ),
      ],
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleBloc, LocaleState>(builder: (context, state) {
      var locale = (state is LocalInitialState)
        ? state.locale
        : (state is LocalChangedState)
          ? state.locale
          : const Locale("en");
      return MaterialApp(
        title: 'HealthyApp',
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        debugShowCheckedModeBanner: false,
        routes: Routes.routesConfig,
        onGenerateRoute: Routes.onGenerateRoute,
        navigatorKey: navigatorKey,
        supportedLocales: Locales.all,
        locale: locale,
        themeMode: ThemeMode.light,
        theme: defaultTheme(context, type: 'light'),
        builder: EasyLoading.init(),
      );
    });
  }
}
