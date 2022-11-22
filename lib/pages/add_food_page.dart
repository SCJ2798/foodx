import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodx/channel/whatsapp_channel.dart';
import 'package:foodx/env/color.dart';
import 'package:foodx/env/size.dart';
import 'package:foodx/env/style.dart';
import 'package:foodx/models/food.dart';
import 'package:foodx/models/food_category.dart';
import 'package:foodx/models/shop.dart';
import 'package:foodx/pages/components/FoodTile.dart';
import 'package:foodx/pages/components/img.dart';

class AddFoodPage extends StatefulWidget {
  Shop shop;
  AddFoodPage({Key? key, required this.shop}) : super(key: key);

  @override
  State<AddFoodPage> createState() => _AddFoodPageState(shop);
}

class _AddFoodPageState extends State<AddFoodPage> {
  Shop shop;
  List<FoodCategory> foodCategories = [];

  ///
  ///
  final _nameTxtController = TextEditingController();
  final _descTxtController = TextEditingController();

  ///
  ///
  final _smallPriceController = TextEditingController();
  final _mediumPriceController = TextEditingController();
  final _largePriceController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  ///
  ///
  String category = '';

  ///
  ///
  _AddFoodPageState(this.shop) {
    foodCategories = shop.menu!.categories!;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    ///
    ///
    _nameTxtController.dispose();
    _descTxtController.dispose();
    _smallPriceController.dispose();
    _mediumPriceController.dispose();
    _largePriceController.dispose();

    ///
    ///
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(
          "Add Food",
          style: TxtStyle.custom(16, kWhite),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            padding: PadMarg.a16,
            child: Column(
              children: [
                Space.h(16),

                ///
                /// NAME
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) return "Food name is required";
                  },
                  style: TxtStyle.custom(16, kBlack),
                  controller: _nameTxtController,
                  decoration: InputDecoration(
                    contentPadding: PadMarg.a16,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: kGrey, width: 0.6)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: kGrey, width: 1.0)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: kGrey, width: 1.0)),
                    label: Text(
                      "Food Name",
                      style: TxtStyle.custom(16, kPrimaryColor),
                    ),
                    hintStyle: TxtStyle.custom(16, kGrey),
                  ),
                ),

                Space.h(16),
                DropdownButtonFormField(
                  value: "A",
                  style: TxtStyle.custom(16, kBlack),
                  decoration: InputDecoration(
                    contentPadding: PadMarg.a16,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: kGrey, width: 0.6)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: kGrey, width: 1.0)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: kGrey, width: 1.0)),
                    label: Text(
                      "Category",
                      style: TxtStyle.custom(12, kPrimaryColor),
                    ),
                    hintText: "Select Category",
                    alignLabelWithHint: true,
                    hintStyle: TxtStyle.custom(16, kGrey),
                  ),
                  items: const [
                    DropdownMenuItem(
                      child: Text("Asd"),
                      value: "A",
                    ),
                    DropdownMenuItem(
                      child: Text("Asd"),
                      value: "B",
                    ),
                  ],
                  onChanged: (value) {
                    category = value.toString();
                  },
                ),

                Space.h(16),
                TextFormField(
                  controller: _descTxtController,
                  style: TxtStyle.custom(16, kBlack),
                  maxLines: 3,
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.top,
                  decoration: InputDecoration(
                    contentPadding: PadMarg.a16,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: kGrey, width: 0.6)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: kGrey, width: 1.0)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: kGrey, width: 1.0)),
                    label: Text(
                      "Description",
                      style: TxtStyle.custom(16, kPrimaryColor),
                    ),
                    alignLabelWithHint: true,
                    hintStyle: TxtStyle.custom(16, kGrey),
                    suffixIcon: Padding(
                      padding: PadMarg.a8,
                    ),
                  ),
                ),

                ///
                /// SMALL
                Space.h(16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: preferedWidth(context, 0.2),
                        child:
                            Text("SMALL", style: TxtStyle.custom(16, kBlack))),
                    SizedBox(
                      width: preferedWidth(context, 0.5),
                      child: TextFormField(
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true, signed: false),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r"[0-9.]")),
                          TextInputFormatter.withFunction((oldValue, newValue) {
                            try {
                              final text = newValue.text;
                              if (text.isNotEmpty) double.parse(text);
                              return newValue;
                            } catch (e) {}
                            return oldValue;
                          }),
                        ],
                        textAlign: TextAlign.end,
                        style: TxtStyle.custom(16, kBlack),
                        decoration: InputDecoration(
                          contentPadding: PadMarg.a16,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: kGrey, width: 0.6)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: kGrey, width: 1.0)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: kGrey, width: 1.0)),
                          label: Text(
                            "Price",
                            style: TxtStyle.custom(16, kPrimaryColor),
                          ),
                          hintStyle: TxtStyle.custom(16, kGrey),
                        ),
                      ),
                    ),
                  ],
                ),

                ///
                /// MEDIUM
                Space.h(16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: preferedWidth(context, 0.2),
                        child:
                            Text("MEDIUM", style: TxtStyle.custom(16, kBlack))),
                    SizedBox(
                      width: preferedWidth(context, 0.5),
                      child: TextFormField(
                        keyboardType: TextInputType.numberWithOptions(
                            decimal: true, signed: false),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r"[0-9.]")),
                          TextInputFormatter.withFunction((oldValue, newValue) {
                            try {
                              final text = newValue.text;
                              if (text.isNotEmpty) double.parse(text);
                              return newValue;
                            } catch (e) {}
                            return oldValue;
                          }),
                        ],
                        textAlign: TextAlign.end,
                        controller: _mediumPriceController,
                        style: TxtStyle.custom(16, kBlack),
                        decoration: InputDecoration(
                          contentPadding: PadMarg.a16,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: kGrey, width: 0.6)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: kGrey, width: 1.0)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: kGrey, width: 1.0)),
                          label: Text(
                            "Price",
                            style: TxtStyle.custom(16, kPrimaryColor),
                          ),
                          hintStyle: TxtStyle.custom(16, kGrey),
                        ),
                      ),
                    ),
                  ],
                ),

                ///
                /// LARGE
                Space.h(16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: preferedWidth(context, 0.2),
                        child:
                            Text("LARGE", style: TxtStyle.custom(16, kBlack))),
                    SizedBox(
                      width: preferedWidth(context, 0.5),
                      child: TextFormField(
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true, signed: false),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r"[0-9.]")),
                          TextInputFormatter.withFunction((oldValue, newValue) {
                            try {
                              final text = newValue.text;
                              if (text.isNotEmpty) double.parse(text);
                              return newValue;
                            } catch (e) {}
                            return oldValue;
                          }),
                        ],
                        textAlign: TextAlign.end,
                        style: TxtStyle.custom(16, kBlack),
                        decoration: InputDecoration(
                          contentPadding: PadMarg.a16,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: kGrey, width: 0.6)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: kGrey, width: 1.0)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: kGrey, width: 1.0)),
                          label: Text(
                            "Price",
                            style: TxtStyle.custom(16, kPrimaryColor),
                          ),
                          hintStyle: TxtStyle.custom(16, kGrey),
                        ),
                      ),
                    ),
                  ],
                ),

                ///
                ///
                Space.h(16),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Cancel",
                            style: TxtStyle.custom(16, kPrimaryColor))),
                    Space.w(16),
                    ElevatedButton(
                        style: ButtonStyle(
                            padding: MaterialStateProperty.resolveWith(
                                (states) => PadMarg.vh(8, 16)),
                            backgroundColor: MaterialStateProperty.resolveWith(
                                (states) => kPrimaryColor)),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            final food = Food(
                                name: _nameTxtController.text.toString(),
                                about: _descTxtController.text.toString(),
                                priceTypes: [
                                  PriceType(
                                      price: _smallPriceController.text
                                              .toString() ??
                                          "0.0",
                                      type: PriceTypeInst.SMALL),
                                  PriceType(
                                      price: _mediumPriceController.text
                                              .toString() ??
                                          "0.0",
                                      type: PriceTypeInst.MEDIUM),
                                  PriceType(
                                      price: _largePriceController.text
                                              .toString() ??
                                          "0.0",
                                      type: PriceTypeInst.SMALL)
                                ],
                                status: FoodStatus.AVALIABLE);

                            print(food.toString());

                            Navigator.pop(context, food);
                          }
                        },
                        child:
                            Text("Submit", style: TxtStyle.custom(16, kWhite))),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
