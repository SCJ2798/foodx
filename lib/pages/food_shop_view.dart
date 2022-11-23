import 'package:flutter/material.dart';
import 'package:foodx/env/color.dart';
import 'package:foodx/env/size.dart';
import 'package:foodx/env/style.dart';
import 'package:foodx/models/Food.dart';
import 'package:foodx/models/food_category.dart';
import 'package:foodx/models/shop.dart';
import 'package:foodx/pages/add_food_page.dart';
import 'package:foodx/pages/add_menu_page.dart';
import 'package:foodx/pages/components/FoodTile.dart';
import 'package:foodx/pages/components/img.dart';
import 'package:foodx/services/food_service.dart';
import 'package:foodx/services/menu_service.dart';

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

  _FoodShopOwnerViewPageState(this.shop);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: getAllData(shop),
          builder: (context, snap) {
            if (snap.hasData && snap.connectionState == ConnectionState.done) {
              print(snap.data);

              shop = snap.data as Shop;

              return DefaultTabController(
                  length: shop.menu!.length,
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
                              Text("Menu",
                                  style: TxtStyle.custom(20, kSecondaryColor)),
                              ElevatedButton(
                                onPressed: () async {
                                  await showModalBottomSheet(
                                    context: context,
                                    builder: (context) =>
                                        AddMenuPage(shop: shop),
                                  );

                                  setState(() {});
                                },
                                child: const Text("Add Menu"),
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateColor.resolveWith(
                                            (states) => kPrimaryColor)),
                              )
                            ],
                          ),
                          Space.h(12),
                          TabBar(
                            isScrollable: true,
                            labelColor: Colors.black87,
                            unselectedLabelColor: Colors.grey,
                            tabs: shop.menu!
                                .map((category) => Tab(text: category.name))
                                .toList(),
                          ),
                          SizedBox(
                            width: preferedWidth(context, 1),
                            height: preferedHeight(context, 0.5),
                            child: FutureBuilder(
                                future: FoodService.instance
                                    .getFoodsByShop("lsuJdCnddF2GtBljRnoJ"),
                                builder: (context, snap) {
                                  print(snap.data);
                                  if (snap.hasData &&
                                      snap.connectionState ==
                                          ConnectionState.done) {
                                    final fds = snap.data as List<Food>;

                                    return TabBarView(
                                      children: List.generate(shop.menu!.length,
                                          (index) {
                                        final mu = shop.menu![index];
                                        final filterFoods = shop.foods!
                                            .where((element) =>
                                                element.menu == mu.id)
                                            .toList();

                                        return ListView(
                                          padding: PadMarg.a12,
                                          children: List.generate(
                                              filterFoods.length,
                                              (i) => FoodTile(
                                                  food: filterFoods[i])),
                                        );
                                      }),
                                    );
                                  } else {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  }
                                }),
                          ),
                        ]),
                      ),
                    ),
                  ]));
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
        heroTag: 'location_btn',
        backgroundColor: kPrimaryColor,
        child: const Icon(Icons.add),
        onPressed: () async {
          await showDialog(
              context: context, builder: (context) => AddFoodPage(shop: shop));
          setState(() {});
        },
      ),
    );
  }

  Future<Shop?> getAllData(Shop shp) async {
    try {
      final menuss =
          await MenuService.instance.getMenuByShop("lsuJdCnddF2GtBljRnoJ");
      final _foods =
          await FoodService.instance.getFoodsByShop("lsuJdCnddF2GtBljRnoJ");

      shp.menu = menuss;
      shp.foods = _foods;

      return shp;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
