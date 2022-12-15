// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import 'package:restro_pro/common/common.dart';
import 'package:restro_pro/dependency/dependency.dart';
import 'package:restro_pro/model/product_model.dart';
import 'package:restro_pro/view/add_button_widget/add_button.dart';
import 'package:restro_pro/view/counter_qty_widget/counter_qty.dart';

class ProductTileWidget extends StatelessWidget {
  const ProductTileWidget({
    Key? key,
    required this.product,
    required this.onTap,
  }) : super(key: key);
  final ProductModel product;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      decoration: glassDecoration,
      child: ListTile(
          title: Text(
            product.name,
            style: kTextLightBold,
          ),
          subtitle: Text(
            "₹${product.price.toString()}",
            style: kTextMedium,
          ),
          trailing: Obx(() => itemController.cartProducts.contains(product)
              ? CounterQtyWidget(
                  product: product,
                )
              : InkWell(
                  borderRadius: kBorderRadiusButton,
                  splashColor: kOrangeSoda,
                  onTap: onTap,
                  child: addButtonWidget(),
                ))),
    );
  }
}
