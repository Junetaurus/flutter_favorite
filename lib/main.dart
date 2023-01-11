import 'package:flutter/material.dart';
import 'package:flutter_favorite/core/router/route.dart';
import 'package:flutter_favorite/ui/shared/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "美食广场",
      theme: AppTheme.norTheme,
      routes: MyRouter.routes,
      initialRoute: MyRouter.initialRoute,
    );
  }
}

