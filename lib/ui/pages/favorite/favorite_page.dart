import 'package:flutter/material.dart';
import 'package:flutter_favorite/core/states/favorite_state.dart';
import 'package:flutter_favorite/ui/widgets/meal_item.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("美食广场"),
      ),
      body: Consumer<FavoriteState>(
        builder: (ctx, value, child) {
          if (value.meals.isEmpty) {
            return Center(
              child: Text("暂无收藏", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
            );
          }
          return ListView.builder(
            itemCount: value.meals.length,
            itemBuilder: (ctx, index){
              return MealItem(value.meals[index]);
            },
          );
        },
      ),
    );
  }
}
