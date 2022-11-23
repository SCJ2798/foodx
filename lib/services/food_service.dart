import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodx/models/Food.dart';

class FoodService {
  static FoodService? _instance;
  static CollectionReference? _collectionReference;

  FoodService() {
    _collectionReference = FirebaseFirestore.instance.collection('foods');
  }

  static FoodService get instance {
    return _instance ?? FoodService();
  }

  Future<List<Food>?> getFoods() async {
    try {
      QuerySnapshot foodCollections = await _collectionReference!.get();
      return foodCollections.docs.map((doc) => Food.toPayload(doc)).toList();
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<Food>?> getFoodById(String id) async {
    try {
      QuerySnapshot foodCollections = await _collectionReference!.get();

      print(foodCollections.docs
          .where((element) => element.id == id)
          .map((doc) => Food.toPayload(doc))
          .toList());

      return foodCollections.docs
          .where((element) => element.id == id)
          .map((doc) => Food.toPayload(doc))
          .toList();
    } catch (e) {
      return null;
    }
  }

  Future<List<Food>?> getFoodsByShop(String shopId) async {
    try {
      QuerySnapshot foodCollections =
          await _collectionReference!.where('shop', isEqualTo: shopId).get();

      return foodCollections.docs.map((doc) => Food.toPayload(doc)).toList();
    } catch (e) {
      return null;
    }
  }

  Future<List<Food>?> getFoodsByMenu(String menuId) async {
    try {
      QuerySnapshot foodCollections =
          await _collectionReference!.where('menu', isEqualTo: menuId).get();

      return foodCollections.docs.map((doc) => Food.toPayload(doc)).toList();
    } catch (e) {
      return null;
    }
  }
}
