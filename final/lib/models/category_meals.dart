import 'meal.dart';

class CategoryMeals {
  String id;
  String categoryTitle;
  String categoryImage;
  List<Meal> meals;

  CategoryMeals({this.id, this.categoryTitle, this.categoryImage, this.meals});

  CategoryMeals.mock() {
    this.id = '0';
    this.categoryTitle = 'Categoria';
    this.meals = List<Meal>.generate(10, (_) => Meal.mock());
  }
}
