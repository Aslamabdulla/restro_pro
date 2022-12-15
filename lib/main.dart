import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:restro_pro/model/hive_model/hive_model_order.dart';

import 'package:restro_pro/view/splash_screen/splash_screen.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(OrderModelAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Restro Pro',
      theme: ThemeData(
        fontFamily: "Nunito",
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}
