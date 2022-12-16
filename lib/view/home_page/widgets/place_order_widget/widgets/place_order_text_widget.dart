import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restro_pro/common/common.dart';
import 'package:restro_pro/common/constants.dart';
import 'package:restro_pro/dependency/dependency.dart';

class PlaceOrderTextWidget extends StatelessWidget {
  const PlaceOrderTextWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kButtonDecoration,
      width: 300.w,
      height: 50.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(
            flex: 2,
          ),
          const Text(
            "Place Order",
            style: kTextBoldBlack,
          ),
          const Spacer(
            flex: 1,
          ),
          Obx(
            () => Text(
              "₹${itemController.total.value.toString()}",
              style: kTextLightBoldBlack,
            ),
          ),
          kWidth10
        ],
      ),
    );
  }
}
