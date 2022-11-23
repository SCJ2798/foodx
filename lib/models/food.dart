import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodx/models/review.dart';

enum FoodStatus { AVALIABLE, NOT_AVALIABLE }

class Food {
  String? name;
  List<dynamic>? priceTypes;
  dynamic status;
  String? about;
  String? imgUrl;
  String? menu;
  List<Review>? reviews;

  Food(
      {this.name,
      this.priceTypes,
      this.status,
      this.about,
      this.imgUrl,
      this.reviews,
      this.menu});

  factory Food.toPayload(QueryDocumentSnapshot snap) {
    final doc = snap.data() as Map<String, dynamic>;
    return Food(
        name: doc['name'],
        about: doc['desc'],
        status: 0,
        menu: doc['menu'],
        priceTypes:
            doc['portion'].map((p) => PriceType.fromDocSnap(p)).toList(),
        imgUrl: "",
        reviews: []);
  }

  String get getStatus {
    switch (this.status) {
      case FoodStatus.AVALIABLE:
        return "Avaliable";
      default:
        return "Not Avaliable";
    }
  }
}

enum PriceTypeInst { SMALL, MEDIUM, LARGE, COMMON }

class PriceType {
  String? name;
  String price;
  dynamic type;

  PriceType({this.name, required this.price, this.type});

  int get getForHomMany {
    switch (type) {
      case PriceTypeInst.SMALL:
        return 1;
      case PriceTypeInst.MEDIUM:
        return 2;
      case PriceTypeInst.LARGE:
        return 3;
      default:
        return 0;
    }
  }

  set setPriceTypeInst(int value) {
    switch (value) {
      case 1:
        type = PriceTypeInst.SMALL;
        break;
      case 2:
        type = PriceTypeInst.MEDIUM;
        break;
      case 3:
        type = PriceTypeInst.LARGE;
        break;
      default:
        type = PriceTypeInst.COMMON;
        break;
    }
  }

  factory PriceType.fromDocSnap(dynamic payload) {
    var priceType = PriceType(price: payload['price'], name: payload['name']);
    priceType.setPriceTypeInst = payload['type'] ?? 0;
    return priceType;
  }
}
