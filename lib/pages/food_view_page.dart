import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:foodx/env/color.dart';
import 'package:foodx/env/size.dart';
import 'package:foodx/env/style.dart';
import 'package:foodx/models/Food.dart';
import 'package:foodx/pages/components/FoodTile.dart';
import 'package:foodx/pages/components/img.dart';
import 'package:foodx/pages/components/review_card.dart';

class FoodViewPage extends StatefulWidget {
  Food food;
  FoodViewPage({Key? key, required this.food}) : super(key: key);

  @override
  State<FoodViewPage> createState() => _FoodViewPageState(food);
}

class _FoodViewPageState extends State<FoodViewPage> {
  Food food;
  _FoodViewPageState(this.food);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
          automaticallyImplyLeading: true,
          leadingWidth: 45,
          pinned: false,
          floating: false,
          expandedHeight: preferedHeight(context, 0.3),
          backgroundColor: kSecondaryColor,
          flexibleSpace: FlexibleSpaceBar(
            collapseMode: CollapseMode.pin,
            titlePadding: PadMarg.vh(0, 0),
            title: Container(
              color: kBlack.withAlpha(128),
              margin: PadMarg.all(0),
              padding: PadMarg.a16,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(food.name!,
                      style: TxtStyle.custom(16, kWhite,
                          fontWeight: FontWeight.w600)),
                ],
              ),
            ),
            background: Image.asset(
              food.imgUrl!,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Space.h(8),
            Container(
              child: GridView.count(
                  childAspectRatio: 0.69,
                  padding: PadMarg.a8,
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  children: List.generate(food.priceTypes!.length, (index) {
                    switch (food.priceTypes![index].type) {
                      case PriceTypeInst.SMALL:
                        return buildSmallPriceView(
                            food.priceTypes![index].price);
                        break;
                      case PriceTypeInst.MEDIUM:
                        return buildMediumPriceView(
                            food.priceTypes![index].price);
                        break;
                      case PriceTypeInst.LARGE:
                        return buildLargePriceView(
                            food.priceTypes![index].price);
                        break;
                      default:
                        return Container();
                        break;
                    }
                  })),
            ),
            Container(
                padding: PadMarg.a16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("About Food",
                        style: TxtStyle.custom(20, kSecondaryColor)),
                    Space.a(16),
                    Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean porta elit ac ultricies congue. Nunc id magna ornare, accumsan elit eu, consequat leo. Curabitur semper lorem pretium porttitor ultrices",
                      style: TxtStyle.custom(14, kSecondaryColor,
                          fontWeight: FontWeight.w200),
                    ),
                    Space.a(32),
                    Text("What people think",
                        style: TxtStyle.custom(20, kSecondaryColor)),
                    Space.a(16),
                    Container(
                        width: preferedWidth(context, 1),
                        height: 240,
                        child: ListView(
                          padding: PadMarg.a12,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          children: List.generate(
                            food.reviews!.length,
                            (i) => ReviewCard(
                              review: food.reviews![i],
                            ),
                          ),
                        )),
                  ],
                )),
          ]),
        ),
      ]),
      floatingActionButton: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Space.w(12),
          FloatingActionButton(
            heroTag: 'whatsapp_btn',
            backgroundColor: kPrimaryColor,
            child: Icon(Icons.whatsapp),
            onPressed: () {},
          ),
          Space.w(12),
          FloatingActionButton(
            heroTag: 'phone_btn',
            backgroundColor: kPrimaryColor,
            child: Icon(Icons.phone),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  AspectRatio buildSmallPriceView(String price) {
    return AspectRatio(
      aspectRatio: 0.69,
      child: Container(
        padding: PadMarg.a16,
        height: 200,
        decoration: BoxDecoration(
          border: Border.all(color: kBlack, width: 1.6),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Icon(
              Icons.accessibility,
              size: 18,
            ),
            Space.h(16),
            Text("LKR", style: TxtStyle.custom(14, kBlack)),
            Space.h(4),
            Text(price,
                style:
                    TxtStyle.custom(24, kBlack, fontWeight: FontWeight.w600)),
            Space.h(16),
            Text("Small",
                style: TxtStyle.custom(16, kBlack, fontWeight: FontWeight.w400))
          ],
        ),
      ),
    );
  }

  AspectRatio buildMediumPriceView(String price) {
    return AspectRatio(
      aspectRatio: 0.69,
      child: Container(
        padding: PadMarg.a16,
        height: 200,
        decoration: BoxDecoration(
          // color: kPrimaryColor.withAlpha(255),
          border: Border.all(color: kBlack, width: 1.6),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.accessibility, size: 18),
                Icon(Icons.accessibility, size: 18),
              ],
            ),
            Space.h(16),
            Text("LKR", style: TxtStyle.custom(14, kBlack)),
            Space.h(4),
            Text(price,
                style:
                    TxtStyle.custom(24, kBlack, fontWeight: FontWeight.w600)),
            Space.h(16),
            Text("Medium",
                style: TxtStyle.custom(16, kBlack, fontWeight: FontWeight.w400))
          ],
        ),
      ),
    );
  }

  AspectRatio buildLargePriceView(String price) {
    return AspectRatio(
      aspectRatio: 0.69,
      child: Container(
        padding: PadMarg.a16,
        height: 200,
        decoration: BoxDecoration(
          border: Border.all(color: kBlack, width: 1.6),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.accessibility, size: 18),
                Icon(Icons.accessibility, size: 18),
                Icon(Icons.accessibility, size: 18),
              ],
            ),
            Space.h(16),
            Text("LKR", style: TxtStyle.custom(14, kBlack)),
            Space.h(4),
            Text(price,
                style:
                    TxtStyle.custom(24, kBlack, fontWeight: FontWeight.w600)),
            Space.h(16),
            Text("Large",
                style: TxtStyle.custom(16, kBlack, fontWeight: FontWeight.w400))
          ],
        ),
      ),
    );
  }
}
