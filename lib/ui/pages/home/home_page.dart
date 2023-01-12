import 'package:flutter/material.dart';
import 'package:flutter_favorite/core/extensions/int_extension.dart';
import 'package:flutter_favorite/core/services/json_parse.dart';
import 'package:flutter_favorite/core/models/category_model.dart';
import 'package:flutter_favorite/ui/pages/meal/meal_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const String routerName = "/home";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> _categories = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //
    JsonParse.getCategoryData().then((value) {
      setState(() {
        _categories = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("美食广场"),
      ),
      body: GridView.builder(
          padding: EdgeInsets.all(10.px),
          itemCount: _categories.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.px,
            mainAxisSpacing: 10.px,
            childAspectRatio: 1.5,
          ),
          itemBuilder: (ctx, index) {
            final Color bgColor = _categories[index].cColor!;

            return GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.circular(10.px),
                    gradient: LinearGradient(colors: [
                      bgColor.withOpacity(0.5),
                      bgColor,
                    ])
                ),
                alignment: Alignment.center,
                child: Text(
                  _categories[index].title!,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              onTap: () {
                Navigator.of(context).pushNamed(MealPage.routerName, arguments: _categories[index]);
              },
            );
          }),
    );
  }
}
