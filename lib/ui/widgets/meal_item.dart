import 'package:flutter/material.dart';
import 'package:flutter_favorite/core/extensions/int_extension.dart';
import 'package:flutter_favorite/core/models/meal_model.dart';
import 'package:flutter_favorite/core/states/favorite_state.dart';
import 'package:flutter_favorite/ui/pages/detail/detail_page.dart';
import 'package:flutter_favorite/ui/widgets/meal_image.dart';
import 'package:provider/provider.dart';

class MealItem extends StatelessWidget {

  final MealModel _model;
  MealItem(this._model);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        margin: EdgeInsets.all(10.px),
        elevation: 5.px,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.px)),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10.px, bottom: 10.px),
              child: Text(_model.title!, style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              )),
            ),
            MealImage(_model.imageUrl!),
            SizedBox(height: 10.px),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Icon(Icons.schedule, color: Colors.pink,),
                    SizedBox(width: 4.px,),
                    Text("${_model.duration}分钟"),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.restaurant, color: Colors.pink),
                    SizedBox(width: 4.px,),
                    Text(_model.complexStr),
                  ],
                ),
                Consumer<FavoriteState>(
                    builder: (ctx, value, child) {
                      final isFavor = value.isFavor(_model);
                      final favorStr = isFavor ? "已收藏" : "未收藏";
                      final favorColor = isFavor ? Colors.pink : Colors.black54;
                      return GestureDetector(
                        child: Row(
                          children: [
                            Icon(Icons.favorite, color: favorColor),
                            SizedBox(width: 4.px,),
                            Text(favorStr, style: TextStyle(color: favorColor),),
                          ],
                        ),
                        onTap: () {
                          value.handelMeal(_model);
                        },
                      );
                    }
                ),
              ],
            ),
            SizedBox(height: 10.px),
          ],
        ),
      ),
      onTap: () {
        Navigator.of(context).pushNamed(DetailPage.routerName, arguments: _model);
      },
    );
  }
}



