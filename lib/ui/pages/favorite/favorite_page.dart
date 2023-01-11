import 'package:flutter/material.dart';

class FavoritePage extends StatefulWidget {
  static const String routerName = "/favorite";

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("美食广场"),
      ),
      body: Center(
        child: Text("收藏"),
      ),
    );
  }
}
