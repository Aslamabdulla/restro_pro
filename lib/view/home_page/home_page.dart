import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restro_pro/common/common.dart';
import 'package:restro_pro/common/custom_clipper.dart';
import 'package:restro_pro/dependency/dependency.dart';

import 'widgets/category_widget.dart';
import 'widgets/place_order_button_widget.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ORDER MENU", style: textHomeHeadStyle),
        centerTitle: true,
        elevation: 0,
        backgroundColor: kClipperBgOrange,
      ),
      body: Stack(
        children: <Widget>[
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              height: 300.0,
              width: Get.width,
              decoration: const BoxDecoration(
                color: kClipperBgOrange,
                //image: DecorationImage(image: NetworkImage('https://www.viajejet.com/wp-content/viajes/Lago-Moraine-Parque-Nacional-Banff-Alberta-Canada-1440x810.jpg'))
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              ExpansionTile(
                title: Text("Most Popular"),
                children: [
                  Text("data"),
                  Text("data"),
                  Text("data"),
                  Text("data"),
                ],
              ),
              CategoryWidget(),
              PlaceOrderButtonWidget()
            ],
          )
        ],
      ),
    );
  }
}
