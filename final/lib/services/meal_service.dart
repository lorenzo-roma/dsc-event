import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:meals_app/models/category_meals.dart';
import 'package:meals_app/models/meal.dart';

class MealsService {
  static const BASE_URL = 'https://www.themealdb.com/api/json/v1/1/';

  static Future<List<CategoryMeals>> getHomeMeals() async {
    List<Map<String, String>> categoryData = await fetchCategoriesData();
    List<CategoryMeals> list = await buildCategoryMeals(categoryData);
    return list;
  }

  static Future<List<Map<String, String>>> fetchCategoriesData() async {
    var response = await http.get('${BASE_URL}categories.php');
    var categories = json.decode(response.body)['categories'];
    List<Map<String, String>> list =
        List<Map<String, String>>.from(categories.map((category) => {
              'name': category['strCategory'] as String,
              'img': category['strCategoryThumb'] as String
            }));
    return list;
  }

  static List<Ingredient> buildIngredients(dynamic meal) {
    final List<Ingredient> toReturn = [];
    for (int i = 0; i < 20; i++) {
      if (meal['strIngredient$i'] != null &&
          meal['strMeasure$i'] != null &&
          meal['strIngredient$i'] != "" &&
          meal['strMeasure$i'] != "") {
        print(meal['strIngredient$i']);
        toReturn.add(new Ingredient(
            measure: meal['strMeasure$i'], name: meal['strIngredient$i']));
      }
    }
    return toReturn;
  }

  static Future<Meal> getMealDetail(String id) async {
    var response = await http.get('${BASE_URL}lookup.php?i=52772');
    var meal = json.decode(response.body)['meals'][0];
    final ingredients = buildIngredients(meal);
    return Meal(
        id: meal['idMeal'],
        title: meal['strMeal'],
        imgUrl: meal['strMealThumb'],
        instructions: meal['strInstructions'],
        ingredients: ingredients);
  }

  static Future<List<CategoryMeals>> buildCategoryMeals(
      List<Map<String, String>> categoryData) async {
    var res = await Future.wait(categoryData.map((data) async {
      String name = data['name'];
      String imgUrl = data['img'];
      var response = await http.get('${BASE_URL}filter.php?c=$name');
      var mealsEntities = json.decode(response.body)['meals'];
      return CategoryMeals(
          categoryTitle: name,
          categoryImage: imgUrl,
          meals: getMealsFromEntities(mealsEntities));
    }));
    return List<CategoryMeals>.from(res);
  }

  static List<Meal> getMealsFromEntities(Iterable<dynamic> mealsEntities) {
    return List<Meal>.from(mealsEntities.take(10).map((meal) {
      return Meal(
          id: meal['idMeal'],
          title: meal['strMeal'],
          imgUrl: meal['strMealThumb']);
    }));
  }
}
