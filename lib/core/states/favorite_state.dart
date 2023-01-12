import 'package:flutter/cupertino.dart';
import 'package:flutter_favorite/core/models/meal_model.dart';

class FavoriteState extends ChangeNotifier {
  List<MealModel> _meals = [];

  List<MealModel> get meals => _meals;

  void addMeal(MealModel model) {
    _meals.add(model);
    notifyListeners();
  }

  void removeMeal(MealModel model) {
    _meals.remove(model);
    notifyListeners();
  }

  void handelMeal(MealModel model) {
    if (isFavor(model)) {
      removeMeal(model);
    } else {
      addMeal(model);
    }
  }

  bool isFavor(MealModel model) {
    return _meals.contains(model);
  }

}