import 'package:flutter/material.dart';
import 'package:foodx/env/color.dart';

class TxtStyle extends TextStyle {
  static final String _kFontFamily = "Poppins";

  TxtStyle.onlySize(double size)
      : super(fontFamily: _kFontFamily, fontSize: size, color: kSecondaryColor);

  TxtStyle.custom(double size, Color color, {FontWeight? fontWeight})
      : super(
            fontFamily: _kFontFamily,
            fontSize: size,
            fontWeight: fontWeight,
            color: color);
}
