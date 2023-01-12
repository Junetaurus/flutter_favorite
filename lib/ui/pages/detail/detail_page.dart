import 'package:flutter/material.dart';
import 'package:flutter_favorite/core/extensions/int_extension.dart';
import 'package:flutter_favorite/core/models/meal_model.dart';
import 'package:flutter_favorite/ui/common/size_fit.dart';
import 'package:flutter_favorite/ui/widgets/meal_image.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);
  static const String routerName = "/detail";

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)!.settings.arguments as MealModel;
    return Scaffold(
        appBar: AppBar(
          title: Text(meal.title!),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              MealImage(meal.imageUrl!),
              buildTitle("制作材料"),
              buildContainer(
                ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true, //自动计算高度
                  physics: NeverScrollableScrollPhysics(), //禁止滚动
                  itemCount: meal.ingredients?.length,
                  itemBuilder: (ctx, index) {
                    return Padding(
                      padding: EdgeInsets.only(left: 10.px, right: 10.px),
                      child: Card(
                        color: Colors.yellow,
                        child: Padding(
                          padding: EdgeInsets.all(5.px),
                          child: Text(meal.ingredients![index],
                              style: TextStyle(fontSize: 15)),
                        ),
                      ),
                    );
                  },
                ),
              ),
              buildTitle("制作步骤"),
              buildContainer(
                ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: meal.steps?.length,
                  itemBuilder: (ctx, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.yellow,
                        child: Text(
                          "#${index + 1}",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      title: Text(
                        meal.steps![index],
                        style: TextStyle(fontSize: 15),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: SizeFit.safeAreaBottomHeight)
            ],
          ),
        ));
  }
}

Widget buildTitle(String title) {
  return Container(
    margin: EdgeInsets.all(10.px),
    child: Text(
      title,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    ),
  );
}

Widget buildContainer(Widget child) {
  return Container(
    width: SizeFit.screenWidth - 20.px,
    padding: EdgeInsets.all(5.px),
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(10.px),
    ),
    child: child,
  );
}
