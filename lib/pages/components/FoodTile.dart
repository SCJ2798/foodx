import 'package:flutter/material.dart';
import 'package:foodx/env/color.dart';
import 'package:foodx/env/size.dart';
import 'package:foodx/env/style.dart';
import 'package:foodx/models/Food.dart';
import 'package:foodx/pages/components/img.dart';
import 'package:foodx/pages/food_view_page.dart';

class FoodTile extends StatelessWidget {
  Food food;
  FoodTile({
    Key? key,
    required this.food,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: PadMarg.v8,
      child: ListTile(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: ((context) => FoodViewPage(food: food)))),
        tileColor: kGrey.withAlpha(12),
        contentPadding: PadMarg.a8,
        horizontalTitleGap: 16,
        minLeadingWidth: 16,
        leading: Img.avatar(food.imgUrl!),
        title: Text(food.name!, style: TxtStyle.custom(16, kSecondaryColor)),
        subtitle: Text(
          "LKR ${food.priceTypes![0].price}",
          style: TxtStyle.custom(12, kPrimaryColor),
        ),
        trailing: Chip(
          backgroundColor: kGrey.withAlpha(128),
          label: Text(food.getStatus, style: TxtStyle.custom(10, kBlack)),
        ),
      ),
    );
  }
}
