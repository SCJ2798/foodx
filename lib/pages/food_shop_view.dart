import 'package:flutter/material.dart';
import 'package:foodx/channel/whatsapp_channel.dart';
import 'package:foodx/env/color.dart';
import 'package:foodx/env/size.dart';
import 'package:foodx/env/style.dart';
import 'package:foodx/models/food.dart';
import 'package:foodx/models/food_category.dart';
import 'package:foodx/models/shop.dart';
import 'package:foodx/pages/add_food_page.dart';
import 'package:foodx/pages/components/FoodTile.dart';
import 'package:foodx/pages/components/img.dart';

class FoodShopOwnerViewPage extends StatefulWidget {
  Shop shop;
  FoodShopOwnerViewPage({Key? key, required this.shop}) : super(key: key);

  @override
  State<FoodShopOwnerViewPage> createState() =>
      _FoodShopOwnerViewPageState(shop);
}

class _FoodShopOwnerViewPageState extends State<FoodShopOwnerViewPage> {
  Shop shop;
  List<FoodCategory> foodCategories = [];

  _FoodShopOwnerViewPageState(this.shop) {
    foodCategories = shop.menu!.categories!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
          length: foodCategories.length,
          child: CustomScrollView(slivers: [
            SliverAppBar(
              automaticallyImplyLeading: true,
              leadingWidth: 45,
              pinned: false,
              floating: false,
              expandedHeight: preferedHeight(context, 0.26),
              backgroundColor: kSecondaryColor,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                titlePadding: PadMarg.all(0),
                title: Container(
                  color: kBlack.withOpacity(0.6),
                  padding: PadMarg.a16,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Space.w(12),
                      Img.avatar(shop.logoImg),
                      Space.w(8),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            shop.name,
                            style: TxtStyle.custom(16, kWhite,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            shop.location!,
                            style: TxtStyle.custom(12, kWhite,
                                fontWeight: FontWeight.w200),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                background: Image.asset(
                  shop.shopImg,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverPadding(
              padding: PadMarg.a16,
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Menu", style: TxtStyle.custom(20, kSecondaryColor)),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("Add Menu"),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateColor.resolveWith(
                                (states) => kPrimaryColor)),
                      )
                    ],
                  ),
                  Space.h(12),
                  TabBar(
                    labelColor: Colors.black87,
                    unselectedLabelColor: Colors.grey,
                    tabs: foodCategories
                        .map((category) => Tab(text: category.name))
                        .toList(),
                  ),
                  SizedBox(
                    width: preferedWidth(context, 1),
                    height: preferedHeight(context, 0.5),
                    child: TabBarView(
                      children: List.generate(
                        foodCategories.length,
                        (index) => ListView(
                          padding: PadMarg.a12,
                          children: List.generate(
                              foodCategories[index].foods.length,
                              (i) => FoodTile(
                                    food: foodCategories[index].foods[i],
                                  )),
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ])),
      floatingActionButton: FloatingActionButton(
        heroTag: 'location_btn',
        backgroundColor: kPrimaryColor,
        child: const Icon(Icons.add),
        onPressed: () async {
          var food = await showDialog(
              context: context, builder: (context) => AddFoodPage(shop: shop));
          if (food != null) {
            setState(() {
              food = food as Food;
              shop.menu!.categories![0].foods.add(food);
            });
          }
        },
      ),
    );
  }
}
