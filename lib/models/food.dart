import 'package:foodx/models/review.dart';

enum FoodStatus { AVALIABLE, NOT_AVALIABLE }

class Food {
  String? name;
  List<PriceType>? priceTypes;
  dynamic status;
  String? about;
  String? imgUrl;
  List<Review>? reviews;

  Food({
    this.name,
    this.priceTypes,
    this.status,
    this.about,
    this.imgUrl,
    this.reviews,
  });

  String get getStatus {
    switch (this.status) {
      case FoodStatus.AVALIABLE:
        return "Avaliable";
      default:
        return "Not Avaliable";
    }
  }
}

enum PriceTypeInst { SMALL, MEDIUM, LARGE }

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
}
