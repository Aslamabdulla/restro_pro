import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restro_pro/common/common.dart';
import 'package:restro_pro/common/custom_clipper.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "MENU",
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: kClipperBgBlue,
      ),
      body: Column(
        children: <Widget>[
          ClipPath(
            clipper: MyClipper(),
            child: Container(
                height: 300.0,
                width: Get.width,
                decoration: const BoxDecoration(
                  color: kClipperBgBlue,
                  //image: DecorationImage(image: NetworkImage('https://www.viajejet.com/wp-content/viajes/Lago-Moraine-Parque-Nacional-Banff-Alberta-Canada-1440x810.jpg'))
                ),
                child: Column(
                  children: [],
                )),
          ),
        ],
      ),
    );
  }
}
