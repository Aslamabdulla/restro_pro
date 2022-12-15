import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:restro_pro/common/common.dart';
import 'package:restro_pro/dependency/dependency.dart';

class PlaceOrderButtonWidget extends StatelessWidget {
  const PlaceOrderButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(8),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          itemController.totalPrice();
        },
        child: Container(
          decoration: kButtonDecoration,
          width: 300,
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(
                flex: 2,
              ),
              const Text(
                "Place Order",
                style: kTextBold,
              ),
              const Spacer(
                flex: 1,
              ),
              Obx(
                () => Text(
                  "₹${itemController.total.value.toString()}",
                  style: kTextLightBold,
                ),
              ),
              kWidth10
            ],
          ),
        ),
      ),
    );
  }
}
