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

  static List<Meal> getMealsFromEntities(mealsEntities) {
    return List<Meal>.from(mealsEntities.map((meal) {
      return Meal(
          id: meal['idMeal'],
          title: meal['strMeal'],
          imgUrl: meal['strMealThumb']);
    }));
  }
}
