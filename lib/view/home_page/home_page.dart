import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:restro_pro/common/constants.dart';
import 'package:restro_pro/common/custom_clipper.dart';
import 'package:restro_pro/dependency/dependency.dart';
import 'package:restro_pro/view/order_page/order_page.dart';

import 'widgets/category_widget/category_widget.dart';
import 'widgets/most_popular_widget/most_popular_tile.dart';
import 'widgets/place_order_widget/place_order_button_widget.dart';

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
        actions: [
          IconButton(
              onPressed: () async {
                await itemController.getPreviousOrders();

                Get.to(() => const OrderHistoryScreen(),
                    transition: Transition.fadeIn,
                    duration: const Duration(milliseconds: 400));
              },
              icon: const Icon(
                Icons.shopping_bag,
                color: kBlack,
              ))
        ],
      ),
      body: Stack(
        children: <Widget>[
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              height: 200.0.h,
              width: Get.width,
              decoration: const BoxDecoration(
                color: kClipperBgOrange,
              ),
            ),
          ),
          Obx(
            () => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  itemController.mostPopularSorted.isNotEmpty
                      ? const MostPopularWidget()
                      : const SizedBox(),
                  const CategoryWidget(),
                  const PlaceOrderButtonWidget()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
