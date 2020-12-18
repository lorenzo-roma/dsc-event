import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:meals_app/models/category_meals.dart';
import 'package:meals_app/models/meal.dart';

class MealsService {
  static const BASE_URL = 'https://www.themealdb.com/api/json/v1/1/';

  static Future<List<CategoryMeals>> getHomeMeals() async {
    List<String> categoryNames = await fetchCategoriesNames();
    List<CategoryMeals> list = await buildCategoryMeals(categoryNames);
    return list;
  }

  static Future<List<String>> fetchCategoriesNames() async {
    var response = await http.get('${BASE_URL}categories.php');
    var categories = json.decode(response.body)['categories'];
    List<String> list = List<String>.from(
        categories.map((category) => category['strCategory']));
    return list;
  }

  static Future<List<CategoryMeals>> buildCategoryMeals(
      List<String> categoryNames) async {
    var res = await Future.wait(categoryNames.map((name) async {
      var response = await http.get('${BASE_URL}filter.php?c=$name');
      var mealsEntities = json.decode(response.body)['meals'];
      return CategoryMeals(
          categoryTitle: name, meals: getMealsFromEntities(mealsEntities));
    }));
    return List<CategoryMeals>.from(res);
  }

  static List<Meal> getMealsFromEntities(mealsEntities) {
    return List<Meal>.from(mealsEntities.map((meal) {
      return Meal(
          id: meal['idMeal'],
          title: meal['strMeal'],
          imgUrl: meal['strMealThumb']);
    }));
  }
}
