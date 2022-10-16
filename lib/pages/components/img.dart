import 'package:flutter/material.dart';
import 'package:foodx/env/color.dart';

class Img extends Container {
  Img.avatar(String path)
      : super(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage(path), fit: BoxFit.cover),
              color: kWhite,
              borderRadius: BorderRadius.circular(50)),
        );
}
