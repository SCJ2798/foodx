import 'package:flutter/material.dart';

double preferedWidth(BuildContext context, double precentage) =>
    MediaQuery.of(context).size.width * precentage;
double preferedHeight(BuildContext context, double precentage) =>
    MediaQuery.of(context).size.height * precentage;

class PadMarg extends EdgeInsets {
  const PadMarg.all(double value) : super.all(value);
  const PadMarg.v(double value) : super.symmetric(vertical: value);
  const PadMarg.h(double value) : super.symmetric(horizontal: value);
  const PadMarg.vh(double verical, double horizontal)
      : super.symmetric(vertical: verical, horizontal: horizontal);

  // ALL
  static EdgeInsets a4 = const PadMarg.all(4);
  static EdgeInsets a8 = const PadMarg.all(8);
  static EdgeInsets a12 = const PadMarg.all(12);
  static EdgeInsets a16 = const PadMarg.all(16);

  // ONLY VERTICAL
  static EdgeInsets v4 = const PadMarg.v(4);
  static EdgeInsets v8 = const PadMarg.v(8);
  static EdgeInsets v12 = const PadMarg.v(12);
  static EdgeInsets v16 = const PadMarg.v(16);

  // ONLY HORIZONTAL
  static EdgeInsets h4 = const PadMarg.h(4);
  static EdgeInsets h8 = const PadMarg.h(8);
  static EdgeInsets h12 = const PadMarg.h(12);
  static EdgeInsets h16 = const PadMarg.h(16);

  static EdgeInsets v4h8 = const PadMarg.vh(4, 8);
  static EdgeInsets v8h4 = const PadMarg.vh(8, 4);

  static EdgeInsets v8h16 = const PadMarg.vh(8, 16);
  static EdgeInsets v16h8 = const PadMarg.vh(16, 8);
}

class Space extends SizedBox {
  Space.a(double size) : super(height: size, width: size);
  Space.w(double size) : super(width: size);
  Space.h(double size) : super(height: size);
}
