import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodx/models/food.dart';
import 'package:foodx/models/food_category.dart';

class FoodMenu {
  String? id;
  String? name;
  List<Food>? foods;

  FoodMenu({this.id, this.name, this.foods});

  factory FoodMenu.fromDocSnap(QueryDocumentSnapshot snap) {
    final doc = snap.data() as Map<String, dynamic>;
    return FoodMenu(id: snap.id, name: doc['name']);
  }
}
