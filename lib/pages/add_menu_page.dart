import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodx/env/color.dart';
import 'package:foodx/env/size.dart';
import 'package:foodx/env/style.dart';
import 'package:foodx/models/Food.dart';
import 'package:foodx/models/food_category.dart';
import 'package:foodx/models/shop.dart';

class AddMenuPage extends StatefulWidget {
  Shop shop;
  AddMenuPage({Key? key, required this.shop}) : super(key: key);

  @override
  State<AddMenuPage> createState() => _AddMenuPageState(shop);
}

class _AddMenuPageState extends State<AddMenuPage> {
  Shop shop;

  ///
  ///
  final _nameTxtController = TextEditingController();
  final _descTxtController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  ///
  ///
  String category = '';

  ///
  ///
  _AddMenuPageState(this.shop) {}

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
                      "Menu name",
                      style: TxtStyle.custom(16, kPrimaryColor),
                    ),
                    hintStyle: TxtStyle.custom(16, kGrey),
                  ),
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
                                (states) => const PadMarg.vh(8, 16)),
                            backgroundColor: MaterialStateProperty.resolveWith(
                                (states) => kPrimaryColor)),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            ///
                            ///
                            CollectionReference foods =
                                FirebaseFirestore.instance.collection('menus');

                            await foods.add({
                              'name': _nameTxtController.text.toString(),
                              'desc': _descTxtController.text.toString(),
                              'shop': 'lsuJdCnddF2GtBljRnoJ',
                              'reviews': []
                            });

                            Navigator.pop(context);
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
