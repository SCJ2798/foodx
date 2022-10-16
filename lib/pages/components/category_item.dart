import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:foodx/env/color.dart';
import 'package:foodx/env/size.dart';
import 'package:foodx/env/style.dart';

class CategoryItem extends StatelessWidget {
  bool selected;
  void Function()? onClick;

  CategoryItem(
      {Key? key, required this.category, this.selected = false, this.onClick})
      : super(key: key);

  final Map<String, dynamic> category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        margin: PadMarg.all(12),
        padding: PadMarg.all(12),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: kSecondaryColor.withAlpha(50),
                  blurRadius: 12,
                  offset: Offset(4, 4))
            ],
            color: selected ? kPrimaryColor : kWhite,
            borderRadius: BorderRadius.circular(50)),
        child: Column(
          children: [
            Container(
              width: 75,
              height: 75,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(category['img']!),
                      fit: BoxFit.fitWidth),
                  color: selected ? kWhite : kGrey,
                  borderRadius: BorderRadius.circular(50)),
            ),
            SizedBox(height: 16),
            Text(
              category['name']!,
              style: TxtStyle.custom(14, selected ? kWhite : kSecondaryColor,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
