import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_favorite/ui/pages/main/main_page.dart';
import 'package:flutter_favorite/ui/pages/meal/meal_page.dart';
import 'package:flutter_favorite/ui/pages/detail/detail_page.dart';

class MyRouter {
  static final String initialRoute = MainPage.routerName;

  static final Map<String, WidgetBuilder> routes = {
    MainPage.routerName: (ctx) => MainPage(),
    MealPage.routerName: (ctx) => MealPage(),
    DetailPage.routerName: (ctx) => DetailPage(),
  };

  static final RouteFactory generateRoute = (settings) {
    return null;
  };

  static final RouteFactory unknownRoute = (settings) {
    return null;
  };
}
