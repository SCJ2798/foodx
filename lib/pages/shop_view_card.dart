import 'package:flutter/material.dart';
import 'package:foodx/env/color.dart';
import 'package:foodx/env/size.dart';
import 'package:foodx/env/style.dart';
import 'package:foodx/models/shop.dart';
import 'package:foodx/pages/shop_view_page.dart';

class ShopViewCard extends StatelessWidget {
  Shop shop;
  ShopViewCard({Key? key, required this.shop}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => ShopViewPage(shop: shop)),
          ),
        );
      },
      child: Container(
        margin: PadMarg.all(16),
        width: preferedWidth(context, 1),
        height: preferedHeight(context, 0.28),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            image: DecorationImage(
                image: AssetImage(shop.shopImg), fit: BoxFit.cover)),
        child: LayoutBuilder(builder: (contex, constraints) {
          return Stack(children: [
            ///
            /// Name
            Positioned(
              right: 0,
              top: 0,
              child: Container(
                width: constraints.maxWidth * 0.8,
                height: 48,
                decoration: const BoxDecoration(
                    color: kWhite,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    )),
                child: Center(
                    child: Text(
                  shop.name,
                  style: TxtStyle.custom(16, kSecondaryColor,
                      fontWeight: FontWeight.w400),
                )),
              ),
            ),

            ///
            /// Address & Rating
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                padding: PadMarg.a16,
                width: constraints.maxWidth,
                height: constraints.maxHeight * 0.4,
                decoration: BoxDecoration(
                    color: kSecondaryColor.withAlpha(128),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    )),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ///
                    /// Address
                    SizedBox(
                      width: constraints.maxWidth * 0.5,
                      child: Text(
                        shop.address,
                        style: TxtStyle.custom(16, kWhite,
                            fontWeight: FontWeight.w400),
                      ),
                    ),

                    ///
                    /// Rating
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.star, color: kWhite),
                        Space.w(4),
                        Text(shop.rating!, style: TxtStyle.custom(16, kWhite))
                      ],
                    )
                  ],
                ),
              ),
            )
          ]);
        }),
      ),
    );
  }
}
