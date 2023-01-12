import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_favorite/core/models/category_model.dart';
import 'package:flutter_favorite/core/models/meal_model.dart';

class JsonParse {
  static Future<List<CategoryModel>> getCategoryData() async {
    final jsonString = await rootBundle.loadString("assets/json/category.json");

    final result = json.decode(jsonString);

    final resultList = result["category"];
    List<CategoryModel> categories = [];
    for (var json in resultList) {
      categories.add(CategoryModel.fromJson(json));
    }

    return categories;
  }

  static Future<List<MealModel>> getMealData() async {
    final jsonString = await rootBundle.loadString("assets/json/meal.json");

    final result = json.decode(jsonString);

    final resultList = result["meal"];
    List<MealModel> meals = [];
    for (var json in resultList) {
      meals.add(MealModel.fromJson(json));
    }

    return meals;
  }
}
