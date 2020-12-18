class Meal {
  static const defaultImage =
      'https://firebasestorage.googleapis.com/v0/b/flutter-website-3527b.appspot.com/o/pasta.png?alt=media&token=21de2a21-0b15-482b-b547-7206e16b760f';

  String id;
  String title;
  String imgUrl;
  Meal({this.id, this.title, this.imgUrl});

  Meal.mock() {
    this.id = '0';
    this.title = 'Spaghetti Carbonara';
    this.imgUrl = defaultImage;
  }
}
