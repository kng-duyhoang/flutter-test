import 'package:flutter/material.dart';
import 'package:test_app/routes/routers.dart';
import 'package:test_app/config/themes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Test',
      routes: Routes.routesConfig,
      onGenerateRoute: Routes.onGenerateRoute,
      theme: defaultTheme(context),
    );
  }
}
