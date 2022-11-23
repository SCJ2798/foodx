import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodx/models/Food.dart';
import 'package:foodx/models/food_menu.dart';

class MenuService {
  static MenuService? _instance;
  static CollectionReference? _collectionReference;

  MenuService() {
    _collectionReference = FirebaseFirestore.instance.collection('menus');
  }

  static MenuService get instance {
    return _instance ?? MenuService();
  }

  Future<List<FoodMenu>?> getMenus() async {
    try {
      QuerySnapshot foodCollections = await _collectionReference!.get();
      return foodCollections.docs
          .map((doc) => FoodMenu.fromDocSnap(doc))
          .toList();
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<FoodMenu>?> getMenuByShop(String shopId) async {
    try {
      QuerySnapshot foodCollections =
          await _collectionReference!.where('shop', isEqualTo: shopId).get();

      return foodCollections.docs
          .map((doc) => FoodMenu.fromDocSnap(doc))
          .toList();

    } catch (e) {
      return null;
    }
  }

  

}
