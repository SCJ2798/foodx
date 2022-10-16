import 'package:flutter/material.dart';
import 'package:foodx/env/color.dart';
import 'package:foodx/env/size.dart';
import 'package:foodx/env/style.dart';

class AppBars extends AppBar {
  String titletText;
  BuildContext context;
  void Function()? onClearSearch;
  void Function()? onTapSearchBar;
  TextEditingController? controller;

  AppBars.withSearchBarAndTitle(
      {required this.titletText,
      required this.context,
      this.controller,
      this.onClearSearch,
      this.onTapSearchBar})
      : super(
          backgroundColor: kWhite.withOpacity(0),
          foregroundColor: kSecondaryColor,
          elevation: 0,
          titleTextStyle:
              TxtStyle.custom(20, kBlack, fontWeight: FontWeight.w400),
          centerTitle: false,
          title: Container(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              titletText,
            ),
          ),
          bottom: PreferredSize(
              preferredSize:
                  Size(preferedWidth(context, 1), preferedHeight(context, 0.1)),
              child: Container(
                  padding: PadMarg.a16,
                  child: TextFormField(
                    readOnly: true,
                    controller: controller,
                    onTap: onTapSearchBar,
                    decoration: InputDecoration(
                        contentPadding: PadMarg.a16,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: kGrey, width: 0.6)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: kGrey, width: 1.0)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: kGrey, width: 1.0)),
                        hintText: "Search area",
                        hintStyle: TxtStyle.custom(16, kGrey),
                        suffixIcon: Padding(
                            padding: PadMarg.a8,
                            child: IconButton(
                                icon: Icon(Icons.close),
                                color: kGrey,
                                onPressed: onClearSearch))),
                  ))),
        );
}
