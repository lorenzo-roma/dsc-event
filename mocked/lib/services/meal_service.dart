import 'package:meals_app/models/category_meals.dart';

class MealsService {
  static List<CategoryMeals> getHomeMeals() {
    return List<CategoryMeals>.generate(10, (_) => CategoryMeals.mock());
  }
}
