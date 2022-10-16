import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foodx/env/color.dart';
import 'package:foodx/env/size.dart';
import 'package:foodx/env/style.dart';
import 'package:foodx/models/shop.dart';
import 'package:foodx/pages/common_widget/app_bars.dart';
import 'package:foodx/pages/components/category_item.dart';
import 'package:foodx/pages/search_city.dart';
import 'package:foodx/pages/shop_view_card.dart';
import 'package:foodx/pages/shop_view_page.dart';
import 'package:foodx/seeds/shops.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final categories = [
    {"img": "assets/img/1.png", "name": "Breakfest", "selected": false},
    {"img": "assets/img/2.png", "name": "Lunch", "selected": true},
    {"img": "assets/img/3.png", "name": "Dinner", "selected": false},
    {"img": "assets/img/4.png", "name": "Desser", "selected": false},
  ];

  final places = shops;

  final _searchCityController = TextEditingController();

  @override
  void dispose() {
    _searchCityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars.withSearchBarAndTitle(
          titletText: "FoodX",
          context: context,
          controller: _searchCityController,
          onClearSearch: () {
            setState(() {
              _searchCityController.text = "";
            });
          },
          onTapSearchBar: () async {
            final searchedPlaceName = await Navigator.push(context,
                MaterialPageRoute(builder: (context) => SearchPlacePage()));

            if (searchedPlaceName != null && searchedPlaceName != '') {
              setState(() {
                _searchCityController.text = searchedPlaceName;
              });
            }
          }),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: PadMarg.all(16),
                  child: Text('Main\nCategories',
                      style: TxtStyle.custom(24, kSecondaryColor)),
                ),
              ],
            ),
            SizedBox(
              width: preferedWidth(context, 1),
              height: 180,
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    categories.length,
                    (index) => CategoryItem(
                      category: categories[index],
                      selected: categories[index]['selected'] as bool,
                      onClick: () {
                        setState(() {
                          var i = 0;
                          categories.forEach((element) {
                            element['selected'] = i == index ? true : false;
                            i++;
                          });
                        });
                      },
                    ),
                  )),
            ),
            FutureBuilder(
              future: getShops(_searchCityController.text.toString()),
              builder: (context, snap) {
                if (snap.hasData &&
                    snap.connectionState == ConnectionState.done) {
                  final filteredShops = snap.data as List<Shop>;

                  if (filteredShops.isEmpty) {
                    return SizedBox(
                        width: preferedHeight(context, 1),
                        height: preferedHeight(context, 0.3),
                        child: Center(
                            child: Text(
                          "No shops here",
                          style: TxtStyle.custom(14, kGrey),
                        )));
                  }

                  return Column(
                      children: List.generate(filteredShops.length,
                          (index) => ShopViewCard(shop: filteredShops[index])));
                } else {
                  return SizedBox(
                    width: preferedWidth(context, 1),
                    height: preferedHeight(context, 0.3),
                    child: const Center(
                        child: CircularProgressIndicator(color: kPrimaryColor)),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<List<Shop>?> getShops(String query) async {
    return await Future.delayed(
      Duration(seconds: 1),
      () {
        if (query.isNotEmpty) {
          var shopList = shops
              .where((shop) => shop.location
                  .toString()
                  .toLowerCase()
                  .startsWith(query.toLowerCase()))
              .toList();
          print(shopList);
          return shopList;
        } else {
          return shops;
        }
      },
    );
  }
}
