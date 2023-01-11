import 'package:flutter/material.dart';
import 'package:flutter_favorite/core/extension/int_extension.dart';
import 'package:flutter_favorite/core/model/category_model.dart';
import 'package:flutter_favorite/core/model/meal_model.dart';
import 'package:flutter_favorite/core/services/json_parse.dart';
import 'package:flutter_favorite/ui/pages/detail/detail_page.dart';
import 'package:flutter_favorite/ui/widgets/meal_image.dart';

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
    Future.delayed(Duration.zero, (){
      final category = ModalRoute.of(context)!.settings.arguments as CategoryModel;
      JsonParse.getMealData().then((value){
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
            return buildItem(_meal[index]);
          }
      ),
    );
  }

  Widget buildItem(MealModel model) {
    return GestureDetector(
      child: Card(
        margin: EdgeInsets.all(10.px),
        elevation: 5.px,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.px)),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10.px, bottom: 10.px),
              child: Text(model.title!, style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              )),
            ),
            MealImage(model.imageUrl!),
            SizedBox(height: 10.px),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Icon(Icons.schedule, color: Colors.pink,),
                    SizedBox(width: 4.px,),
                    Text("${model.duration}分钟"),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.restaurant, color: Colors.pink),
                    SizedBox(width: 4.px,),
                    Text(model.complexStr),
                  ],
                ),
                GestureDetector(
                  child: Row(
                    children: [
                      Icon(Icons.favorite, color: Colors.pink),
                      SizedBox(width: 4.px,),
                      Text("收藏"),
                    ],
                  ),
                  onTap: () {

                  },
                )
              ],
            ),
            SizedBox(height: 10.px),
          ],
        ),
      ),
      onTap: () {
        Navigator.of(context).pushNamed(DetailPage.routerName, arguments: model);
      },
    );
  }
}
