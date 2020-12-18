class Meal {
  static const defaultImage =
      'https://www.themealdb.com/images/media/meals/llcbn01574260722.jpg/preview';

  String id;
  String title;
  String imgUrl;
  Meal({this.id, this.title, this.imgUrl});

  Meal.mock() {
    this.id = '0';
    this.title = 'Titolo';
    this.imgUrl = defaultImage;
  }
}
