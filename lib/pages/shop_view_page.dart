import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:foodx/channel/whatsapp_channel.dart';
import 'package:foodx/env/color.dart';
import 'package:foodx/env/size.dart';
import 'package:foodx/env/style.dart';
import 'package:foodx/models/food_category.dart';
import 'package:foodx/models/shop.dart';
import 'package:foodx/pages/components/FoodTile.dart';
import 'package:foodx/pages/components/img.dart';
import 'package:foodx/pages/components/review_card.dart';
import 'package:foodx/seeds/shops.dart';

class ShopViewPage extends StatefulWidget {
  Shop shop;
  ShopViewPage({Key? key, required this.shop}) : super(key: key);

  @override
  State<ShopViewPage> createState() => _ShopViewPageState(shop);
}

class _ShopViewPageState extends State<ShopViewPage> {
  Shop shop;
  List<FoodCategory> foodCategories = [];

  _ShopViewPageState(this.shop) {
    foodCategories = [];
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
              expandedHeight: preferedHeight(context, 0.3),
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
            SliverList(
                delegate: SliverChildListDelegate([
              Space.h(16),
              Container(
                padding: PadMarg.v8h16,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.pedal_bike,
                          color: kPrimaryColor,
                        ),
                        Space.w(16),
                        Text(
                          "100",
                          style: TxtStyle.custom(16, kSecondaryColor),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.alarm_rounded,
                          color: kPrimaryColor,
                        ),
                        Space.w(16),
                        Text(
                          "10 - 20 min",
                          style: TxtStyle.custom(16, kSecondaryColor),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star_outline_outlined,
                          color: kPrimaryColor,
                        ),
                        Space.w(16),
                        Text(
                          "100",
                          style: TxtStyle.custom(16, kSecondaryColor),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ])),
            SliverPadding(
              padding: PadMarg.a16,
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  Text("Menu", style: TxtStyle.custom(20, kSecondaryColor)),
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
            SliverList(
              delegate: SliverChildListDelegate([
                Container(
                    padding: PadMarg.a16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Details",
                            style: TxtStyle.custom(20, kSecondaryColor)),
                        Space.a(16),
                        Row(
                          children: [
                            Icon(
                              Icons.location_pin,
                              size: 24,
                              color: kPrimaryColor,
                            ),
                            Space.a(16),
                            Text(
                              shop.address,
                              style: TxtStyle.custom(16, kSecondaryColor),
                            )
                          ],
                        ),
                        Space.a(32),
                        Text("Reviews",
                            style: TxtStyle.custom(20, kSecondaryColor)),
                        Space.a(16),
                        SizedBox(
                          width: preferedWidth(context, 1),
                          height: 220,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: List.generate(
                              shop.reviews!.length,
                              (index) => ReviewCard(
                                review: shop.reviews![index],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ))
              ]),
            ),
          ])),
      floatingActionButton: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'location_btn',
            backgroundColor: kPrimaryColor,
            child: Icon(Icons.location_pin),
            onPressed: () {},
          ),
          Space.w(12),
          FloatingActionButton(
            heroTag: 'whatsapp_btn',
            backgroundColor: kPrimaryColor,
            child: const Icon(Icons.whatsapp),
            onPressed: () async {
              await WhatsappChannel.instance
                  .sendWhatsppMsg("+94763840285", "Hi ....");
            },
          ),
          Space.w(12),
          FloatingActionButton(
            heroTag: 'phone_btn',
            backgroundColor: kPrimaryColor,
            child: const Icon(Icons.phone),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
