import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restro_pro/view/home_page/home_page.dart';
import 'package:restro_pro/view/splash_screen/splash_screen.dart';

void main() {
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
