import 'package:flutter/material.dart';
import 'package:foodx/env/color.dart';
import 'package:foodx/env/size.dart';
import 'package:foodx/env/style.dart';
import 'package:foodx/models/review.dart';
import 'package:foodx/pages/components/img.dart';

class ReviewCard extends StatelessWidget {
  Review review;
  ReviewCard({Key? key, required this.review}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.8,
      child: Container(
        width: 320,
        padding: PadMarg.a16,
        margin: PadMarg.a8,
        decoration: BoxDecoration(
            color: kWhite,
            boxShadow: [
              BoxShadow(
                  color: kBlack.withOpacity(0.1),
                  offset: const Offset(4, 8),
                  spreadRadius: 2,
                  blurRadius: 12)
            ],
            borderRadius: BorderRadius.circular(16)),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Space.w(16),
                    Img.avatar(review.userImg!),
                    Space.w(16),
                    Text(review.userName!, style: TxtStyle.custom(14, kBlack)),
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star_outline,
                      color: kPrimaryColor,
                    ),
                    Space.w(8),
                    Text(review.rating!),
                    Space.w(8),
                  ],
                )
              ],
            ),
            Container(
              padding: PadMarg.a16,
              child: Text(
                review.review!,
                style: TxtStyle.custom(14, kBlack, fontWeight: FontWeight.w200),
              ),
            )
          ],
        ),
      ),
    );
  }
}
