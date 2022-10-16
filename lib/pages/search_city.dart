import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:foodx/env/color.dart';
import 'package:foodx/env/size.dart';
import 'package:foodx/env/style.dart';
import 'package:foodx/pages/food_view_page.dart';
import 'package:foodx/src/cities.dart';

class SearchPlacePage extends StatefulWidget {
  const SearchPlacePage({Key? key}) : super(key: key);

  @override
  State<SearchPlacePage> createState() => _SearchPlacePageState();
}

class _SearchPlacePageState extends State<SearchPlacePage> {
  
  List<Map<String, String>> search_cities = cities["Colombo"]!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhite.withOpacity(0),
        foregroundColor: kSecondaryColor,
        elevation: 0,
        title: Text("Search Area"),
        bottom: PreferredSize(
            preferredSize:
                Size(preferedWidth(context, 1), preferedHeight(context, 0.1)),
            child: Container(
                padding: PadMarg.a16,
                child: TextFormField(
                  onChanged: (value) {
                    setState(() {
                      if (value.isNotEmpty) {
                        search_cities = cities["Colombo"]!
                            .where((element) => element['city']
                                .toString()
                                .toLowerCase()
                                .startsWith(value.toLowerCase()))
                            .toList();
                      } else {
                        search_cities = cities["Colombo"]!;
                      }
                    });
                  },
                  decoration: InputDecoration(
                      contentPadding: PadMarg.a16,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(color: kGrey, width: 0.6)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(color: kBlack, width: 1.0)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(color: kBlack, width: 1.0)),
                      hintText: "Enter area name here",
                      hintStyle: TxtStyle.custom(16, kGrey)),
                ))),
      ),
      body: SafeArea(
          child: Container(
        padding: PadMarg.a12,
        child: Column(
          children: [
            Expanded(
                child: ListView(
              children: search_cities
                  .map((e) => buildCityListTile(context, e))
                  .toList(),
            ))
          ],
        ),
      )),
    );
  }

  Widget buildCityListTile(BuildContext context, Map<String, String> e) {
    return ListTile(
      onTap: () {
        print(e['city']);
        Navigator.of(context).pop(e['city']);
      },
      contentPadding: PadMarg.a12,
      minVerticalPadding: 16,
      horizontalTitleGap: 16,
      leading: CircleAvatar(
          backgroundColor: kPrimaryColor.withOpacity(0.1),
          child: const Icon(Icons.location_pin, color: kPrimaryColor)),
      title: Text(
        e['city'].toString(),
        style: TxtStyle.custom(16, kPrimaryColor),
      ),
    );
  }
}
