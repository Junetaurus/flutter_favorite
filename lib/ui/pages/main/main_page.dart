import 'package:flutter/material.dart';
import 'package:flutter_favorite/ui/pages/favorite/favorite_page.dart';
import 'package:flutter_favorite/ui/pages/home/home_page.dart';
import 'package:flutter_favorite/ui/common/size_fit.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  static const String routerName = "/";

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {

    SizeFit.initialize();

    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          HomePage(),
          FavoritePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        unselectedFontSize: 14,
        selectedFontSize: 14,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "首页",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: "收藏",
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
