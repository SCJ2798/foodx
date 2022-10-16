import 'package:foodx/models/Food.dart';
import 'package:foodx/models/food_category.dart';
import 'package:foodx/models/food_menu.dart';
import 'package:foodx/models/review.dart';
import 'package:foodx/models/shop.dart';

final shops = [
  Shop(
    name: "Hela Food",
    address: "54/1 Araliya Mawatha,Rajagiriya",
    shopImg: "assets/img/shop1.png",
    logoImg: "assets/img/logo1.png",
    rating: "4.8",
    location: "Rajagiriya",
    reviews: [
      Review(
        userName: "Kamal Perera",
        userImg: "assets/img/person1.png",
        review:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus ut urna mollis",
        rating: "4.8",
      ),
    ],
    menu: FoodMenu(
      categories: [
        FoodCategory(
          name: "Breakfest",
          foods: [
            Food(
              name: "Milk Rice",
              imgUrl: "assets/img/milkrice.png",
              priceTypes: [
                PriceType(
                    price: "100", name: "Small", type: PriceTypeInst.SMALL),
                PriceType(
                    price: "200", name: "Medium", type: PriceTypeInst.MEDIUM),
                PriceType(
                    price: "300", name: "Large", type: PriceTypeInst.LARGE),
              ],
              status: FoodStatus.AVALIABLE,
              reviews: [
                Review(
                  userName: "Kamal Perera",
                  userImg: "assets/img/person1.png",
                  review:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus ut urna mollis",
                  rating: "4.8",
                ),
                Review(
                  userName: "Gayan Sampath",
                  userImg: "assets/img/person2.png",
                  review:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus ut urna mollis",
                  rating: "5.0",
                ),
              ],
              about:
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus ut urna mollis, facilisis ",
            ),
            Food(
              name: "Strings Hoppers",
              imgUrl: "assets/img/stringhoppers.png",
              priceTypes: [
                PriceType(
                    price: "50", name: "Small", type: PriceTypeInst.SMALL),
                PriceType(
                    price: "100", name: "Medium", type: PriceTypeInst.MEDIUM),
                PriceType(
                    price: "150", name: "Large", type: PriceTypeInst.LARGE),
              ],
              status: FoodStatus.AVALIABLE,
              reviews: [
                Review(
                  userName: "Nimal Perera",
                  userImg: "assets/img/person1.png",
                  review:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus ut urna mollis",
                  rating: "4.8",
                ),
                Review(
                  userName: "Sampath Jayaweera",
                  userImg: "assets/img/person2.png",
                  review:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus ut urna mollis",
                  rating: "5.0",
                ),
              ],
              about:
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus ut urna mollis, facilisis ",
            )
          ],
        ),
        FoodCategory(
          name: "Lunch",
          foods: [
            Food(
              name: "Fried Rice",
              imgUrl: "assets/img/fried_rice.png",
              priceTypes: [
                PriceType(
                    price: "250", name: "Small", type: PriceTypeInst.SMALL),
                PriceType(
                    price: "300", name: "Medium", type: PriceTypeInst.MEDIUM),
                PriceType(
                    price: "400", name: "Large", type: PriceTypeInst.LARGE),
              ],
              status: FoodStatus.AVALIABLE,
              reviews: [
                Review(
                  userName: "Kamal Perera",
                  userImg: "assets/img/person1.png",
                  review:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus ut urna mollis",
                  rating: "4.8",
                ),
                Review(
                  userName: "Gayan Sampath",
                  userImg: "assets/img/person2.png",
                  review:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus ut urna mollis",
                  rating: "5.0",
                ),
              ],
              about:
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus ut urna mollis, facilisis ",
            ),
          ],
        ),
        FoodCategory(
          name: "Dinner",
          foods: [
            Food(
              name: "Fried Rice",
              imgUrl: "assets/img/fried_rice.png",
              priceTypes: [
                PriceType(
                    price: "350", name: "Small", type: PriceTypeInst.SMALL),
                PriceType(
                    price: "400", name: "Medium", type: PriceTypeInst.MEDIUM),
                PriceType(
                    price: "600", name: "Large", type: PriceTypeInst.LARGE),
              ],
              status: FoodStatus.AVALIABLE,
              reviews: [
                Review(
                  userName: "Nimal Perera",
                  userImg: "assets/img/person1.png",
                  review:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus ut urna mollis",
                  rating: "4.8",
                ),
                Review(
                  userName: "Gayan Sampath",
                  userImg: "assets/img/person2.png",
                  review:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus ut urna mollis",
                  rating: "5.0",
                ),
              ],
              about:
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus ut urna mollis, facilisis ",
            ),
          ],
        ),
      ],
    ),
  ),
  Shop(
    name: "Perera Foods",
    address: "54/1 Nelum Av, Colombo 01",
    shopImg: "assets/img/shop2.png",
    logoImg: "assets/img/logo2.png",
    rating: "4.8",
    location: "Colombo 01",
    reviews: [
      Review(
        userName: "Supun Mudalige",
        userImg: "assets/img/person1.png",
        review:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus ut urna mollis",
        rating: "5.0",
      ),
    ],
    menu: FoodMenu(
      categories: [
        FoodCategory(
          name: "Breakfest",
          foods: [
            Food(
              name: "Milk Rice",
              imgUrl: "assets/img/milkrice.png",
              priceTypes: [
                PriceType(
                    price: "100", name: "Small", type: PriceTypeInst.SMALL),
                PriceType(
                    price: "200", name: "Medium", type: PriceTypeInst.MEDIUM),
                PriceType(
                    price: "300", name: "Large", type: PriceTypeInst.LARGE),
              ],
              status: FoodStatus.AVALIABLE,
              reviews: [
                Review(
                  userName: "Kamal Perera",
                  userImg: "assets/img/person1.png",
                  review:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus ut urna mollis",
                  rating: "4.8",
                ),
                Review(
                  userName: "Gayan Sampath",
                  userImg: "assets/img/person2.png",
                  review:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus ut urna mollis",
                  rating: "5.0",
                ),
              ],
              about:
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus ut urna mollis, facilisis ",
            ),
            Food(
              name: "Strings Hoppers",
              imgUrl: "assets/img/stringhoppers.png",
              priceTypes: [
                PriceType(
                    price: "50", name: "Small", type: PriceTypeInst.SMALL),
                PriceType(
                    price: "100", name: "Medium", type: PriceTypeInst.MEDIUM),
                PriceType(
                    price: "150", name: "Large", type: PriceTypeInst.LARGE),
              ],
              status: FoodStatus.AVALIABLE,
              reviews: [
                Review(
                  userName: "Nimal Perera",
                  userImg: "assets/img/person1.png",
                  review:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus ut urna mollis",
                  rating: "4.8",
                ),
                Review(
                  userName: "Sampath Jayaweera",
                  userImg: "assets/img/person2.png",
                  review:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus ut urna mollis",
                  rating: "5.0",
                ),
              ],
              about:
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus ut urna mollis, facilisis ",
            )
          ],
        ),
        FoodCategory(
          name: "Lunch",
          foods: [
            Food(
              name: "Fried Rice",
              imgUrl: "assets/img/fried_rice.png",
              priceTypes: [
                PriceType(
                    price: "250", name: "Small", type: PriceTypeInst.SMALL),
                PriceType(
                    price: "300", name: "Medium", type: PriceTypeInst.MEDIUM),
                PriceType(
                    price: "400", name: "Large", type: PriceTypeInst.LARGE),
              ],
              status: FoodStatus.AVALIABLE,
              reviews: [
                Review(
                  userName: "Kamal Perera",
                  userImg: "assets/img/person1.png",
                  review:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus ut urna mollis",
                  rating: "4.8",
                ),
                Review(
                  userName: "Gayan Sampath",
                  userImg: "assets/img/person2.png",
                  review:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus ut urna mollis",
                  rating: "5.0",
                ),
              ],
              about:
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus ut urna mollis, facilisis ",
            ),
          ],
        ),
        FoodCategory(
          name: "Dinner",
          foods: [
            Food(
              name: "Fried Rice",
              imgUrl: "assets/img/fried_rice.png",
              priceTypes: [
                PriceType(
                    price: "350", name: "Small", type: PriceTypeInst.SMALL),
                PriceType(
                    price: "400", name: "Medium", type: PriceTypeInst.MEDIUM),
                PriceType(
                    price: "600", name: "Large", type: PriceTypeInst.LARGE),
              ],
              status: FoodStatus.AVALIABLE,
              reviews: [
                Review(
                  userName: "Nimal Perera",
                  userImg: "assets/img/person1.png",
                  review:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus ut urna mollis",
                  rating: "4.8",
                ),
                Review(
                  userName: "Gayan Sampath",
                  userImg: "assets/img/person2.png",
                  review:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus ut urna mollis",
                  rating: "5.0",
                ),
              ],
              about:
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus ut urna mollis, facilisis ",
            ),
          ],
        ),
      ],
    ),
  ),
  Shop(
    name: "Kapila Foods",
    address: "65/1 , ABC Av, Colombo 02",
    shopImg: "assets/img/shop3.png",
    logoImg: "assets/img/logo3.png",
    rating: "4.8",
    location: "Colombo 02",
    reviews: [
      Review(
        userName: "Pathum Nissanka",
        userImg: "assets/img/person1.png",
        review:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus ut urna mollis",
        rating: "5.0",
      ),
    ],
    menu: FoodMenu(
      categories: [
        FoodCategory(
          name: "Breakfest",
          foods: [
            Food(
              name: "Milk Rice",
              imgUrl: "assets/img/milkrice.png",
              priceTypes: [
                PriceType(
                    price: "100", name: "Small", type: PriceTypeInst.SMALL),
                PriceType(
                    price: "200", name: "Medium", type: PriceTypeInst.MEDIUM),
                PriceType(
                    price: "300", name: "Large", type: PriceTypeInst.LARGE),
              ],
              status: FoodStatus.AVALIABLE,
              reviews: [
                Review(
                  userName: "Kamal Perera",
                  userImg: "assets/img/person1.png",
                  review:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus ut urna mollis",
                  rating: "4.8",
                ),
                Review(
                  userName: "Gayan Sampath",
                  userImg: "assets/img/person2.png",
                  review:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus ut urna mollis",
                  rating: "5.0",
                ),
              ],
              about:
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus ut urna mollis, facilisis ",
            ),
            Food(
              name: "Strings Hoppers",
              imgUrl: "assets/img/stringhoppers.png",
              priceTypes: [
                PriceType(
                    price: "50", name: "Small", type: PriceTypeInst.SMALL),
                PriceType(
                    price: "100", name: "Medium", type: PriceTypeInst.MEDIUM),
                PriceType(
                    price: "150", name: "Large", type: PriceTypeInst.LARGE),
              ],
              status: FoodStatus.AVALIABLE,
              reviews: [
                Review(
                  userName: "Nimal Perera",
                  userImg: "assets/img/person1.png",
                  review:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus ut urna mollis",
                  rating: "4.8",
                ),
                Review(
                  userName: "Sampath Jayaweera",
                  userImg: "assets/img/person2.png",
                  review:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus ut urna mollis",
                  rating: "5.0",
                ),
              ],
              about:
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus ut urna mollis, facilisis ",
            )
          ],
        ),
        FoodCategory(
          name: "Lunch",
          foods: [
            Food(
              name: "Fried Rice",
              imgUrl: "assets/img/fried_rice.png",
              priceTypes: [
                PriceType(
                    price: "250", name: "Small", type: PriceTypeInst.SMALL),
                PriceType(
                    price: "300", name: "Medium", type: PriceTypeInst.MEDIUM),
                PriceType(
                    price: "400", name: "Large", type: PriceTypeInst.LARGE),
              ],
              status: FoodStatus.AVALIABLE,
              reviews: [
                Review(
                  userName: "Kamal Perera",
                  userImg: "assets/img/person1.png",
                  review:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus ut urna mollis",
                  rating: "4.8",
                ),
                Review(
                  userName: "Gayan Sampath",
                  userImg: "assets/img/person2.png",
                  review:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus ut urna mollis",
                  rating: "5.0",
                ),
              ],
              about:
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus ut urna mollis, facilisis ",
            ),
          ],
        ),
        FoodCategory(
          name: "Dinner",
          foods: [
            Food(
              name: "Fried Rice",
              imgUrl: "assets/img/fried_rice.png",
              priceTypes: [
                PriceType(
                    price: "350", name: "Small", type: PriceTypeInst.SMALL),
                PriceType(
                    price: "400", name: "Medium", type: PriceTypeInst.MEDIUM),
                PriceType(
                    price: "600", name: "Large", type: PriceTypeInst.LARGE),
              ],
              status: FoodStatus.AVALIABLE,
              reviews: [
                Review(
                  userName: "Nimal Perera",
                  userImg: "assets/img/person1.png",
                  review:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus ut urna mollis",
                  rating: "4.8",
                ),
                Review(
                  userName: "Gayan Sampath",
                  userImg: "assets/img/person2.png",
                  review:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus ut urna mollis",
                  rating: "5.0",
                ),
              ],
              about:
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus ut urna mollis, facilisis ",
            ),
          ],
        ),
      ],
    ),
  ),
];
