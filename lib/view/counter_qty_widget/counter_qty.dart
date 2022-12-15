// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:restro_pro/common/common.dart';
import 'package:restro_pro/controller/item_controller/item_controller.dart';
import 'package:restro_pro/dependency/dependency.dart';
import 'package:restro_pro/model/product_model.dart';

import 'widgets/widgets.dart';

class CounterQtyWidget extends StatelessWidget {
  CounterQtyWidget({
    Key? key,
    required this.product,
  }) : super(key: key);
  final ProductModel product;
  int quantity = 1;

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
                      colorText: kred);
                } else {
                  product.quantity--;
                }
                ctrl.totalPrice();
                ctrl.update();
              }, Icons.remove),
              kWidth5,
              Text(
                product.quantity.toString(),
                style: const TextStyle(fontSize: 18),
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
