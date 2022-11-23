import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foodx/firebase_options.dart';
import 'package:foodx/pages/add_food_page.dart';
import 'package:foodx/pages/food_shop_view.dart';
import 'package:foodx/pages/food_view_page.dart';
import 'package:foodx/pages/home_page.dart';
import 'package:foodx/seeds/shops.dart';

// void main() {
//   runApp(DevicePreview(
//     enabled: true,
//     isToolbarVisible: false,
//     builder: (context) => const MyApp(),
//   ));
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.android);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        title: 'Foodx',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: FoodShopOwnerViewPage(shop: tshops[0]));
  }
}
