import 'package:foodx/models/food_menu.dart';
import 'package:foodx/models/review.dart';

class Shop {
  String name;
  String address;
  String shopImg;
  String logoImg;
  String? rating;
  String? location;

  List<Review>? reviews;
  FoodMenu? menu;

  Shop(
      {required this.name,
      required this.address,
      required this.shopImg,
      required this.logoImg,
      this.location,
      this.rating,
      this.reviews,
      this.menu});
}
