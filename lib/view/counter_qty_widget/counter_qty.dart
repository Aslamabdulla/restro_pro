// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:restro_pro/common/constants.dart';
import 'package:restro_pro/controller/item_controller/item_controller.dart';

import 'widgets/widgets.dart';

class CounterQtyWidget extends StatelessWidget {
  const CounterQtyWidget({
    Key? key,
    required this.product,
  }) : super(key: key);
  final dynamic product;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemController>(
        init: ItemController(),
        builder: (ctrl) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildCounter(() {
                if (product.quantity <= 1) {
                  ctrl.cartProducts.remove(product);

                  Get.snackbar("Message", "Item Removed From Cart",
                      colorText: kred, backgroundColor: kWhite);
                } else {
                  product.quantity--;
                }
                ctrl.totalPrice();
                ctrl.update();
              }, Icons.remove),
              kWidth5,
              Text(
                product.quantity.toString(),
                style: TextStyle(fontSize: 18.sp),
              ),
              kWidth5,
              buildCounter(() {
                product.quantity++;
                ctrl.totalPrice();
                ctrl.update();
              }, Icons.add)
            ],
          );
        });
  }
}
