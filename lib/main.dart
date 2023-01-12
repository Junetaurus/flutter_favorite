import 'package:flutter/material.dart';
import 'package:flutter_favorite/core/models/meal_model.dart';
import 'package:flutter_favorite/core/routes/route.dart';
import 'package:flutter_favorite/core/states/favorite_state.dart';
import 'package:flutter_favorite/ui/common/app_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (ctx) => FavoriteState()),
        ],
      child: const MyApp(),
    ),
  );
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

