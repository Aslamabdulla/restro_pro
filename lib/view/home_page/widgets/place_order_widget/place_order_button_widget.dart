import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:restro_pro/common/common.dart';
import 'package:restro_pro/common/constants.dart';

import 'package:restro_pro/dependency/dependency.dart';
import 'package:restro_pro/view/home_page/widgets/dialogue_button_widget/dialogue_button_widget.dart';

class PlaceOrderButtonWidget extends StatelessWidget {
  const PlaceOrderButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(8),
      child: GestureDetector(
        onTap: () async {
          if (itemController.cartProducts.isEmpty) {
            Get.snackbar("Warning", "No Item Selected",
                colorText: kDakred, backgroundColor: kWhite);
          } else {
            Get.defaultDialog(
                confirm: GestureDetector(
                    onTap: () => Get.back(), child: const DialogueButton()),
                title: "Success",
                content: Column(
                  children: [
                    Image.asset(
                      "assets/images/success.gif",
                      fit: BoxFit.cover,
                    )
                  ],
                ));
            itemController.totalPrice();

            await itemController.mapOrder();
            itemController.update();
          }
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
        ),
      ),
    );
  }
}
