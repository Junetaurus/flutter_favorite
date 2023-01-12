import 'package:flutter/material.dart';
import 'package:flutter_favorite/core/extensions/int_extension.dart';
import 'package:flutter_favorite/core/models/category_model.dart';
import 'package:flutter_favorite/core/models/meal_model.dart';
import 'package:flutter_favorite/core/services/json_parse.dart';
import 'package:flutter_favorite/ui/pages/detail/detail_page.dart';
import 'package:flutter_favorite/ui/widgets/meal_image.dart';

import '../../widgets/meal_item.dart';

class MealPage extends StatefulWidget {
  const MealPage({Key? key}) : super(key: key);
  static const String routerName = "/meal";

  @override
  State<MealPage> createState() => _MealPageState();
}

class _MealPageState extends State<MealPage> {

  List<MealModel> _meal = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () {
      final category = ModalRoute
          .of(context)!
          .settings
          .arguments as CategoryModel;
      JsonParse.getMealData().then((value) {
        List<MealModel> meal = value.where((element) {
          return element.categories!.contains(category.id!);
        }).toList();
        print(meal);
        setState(() {
          _meal = meal;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as CategoryModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title!),
      ),
      body: ListView.builder(
          itemCount: _meal.length,
          itemBuilder: (ctx, index) {
            return MealItem(_meal[index]);
          }
      ),
    );
  }
}
