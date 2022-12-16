import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:restro_pro/common/constants.dart';
import 'package:restro_pro/common/custom_clipper.dart';
import 'package:restro_pro/view/order_page/widgets/build_order_tile_widget.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final box = Hive.box("history");
    var products = box.get("orders") as List<dynamic>;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: kBlack,
        title: const Text("PURCHASE HISTORY", style: textHomeHeadStyle),
        centerTitle: true,
        elevation: 0,
        backgroundColor: kClipperBgOrange,
      ),
      body: Stack(
        children: <Widget>[
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              height: 200.h,
              width: Get.width,
              decoration: const BoxDecoration(
                color: kClipperBgOrange,
                //image: DecorationImage(image: NetworkImage('https://www.viajejet.com/wp-content/viajes/Lago-Moraine-Parque-Nacional-Banff-Alberta-Canada-1440x810.jpg'))
              ),
            ),
          ),
          products.isEmpty
              ? const Center(
                  child: Text(
                    "NO ITEM PURCHASED",
                    style: kTextBoldBlack,
                  ),
                )
              : ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return buildOrderTileWidget(products, index);
                  },
                  itemCount: products.length,
                ),
        ],
      ),
    );
  }
}
