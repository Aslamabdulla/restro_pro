// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restro_pro/common/common.dart';
import 'package:restro_pro/common/constants.dart';
import 'package:restro_pro/dependency/dependency.dart';
import 'package:restro_pro/view/add_button_widget/add_button.dart';
import 'package:restro_pro/view/counter_qty_widget/counter_qty.dart';
import 'package:restro_pro/view/home_page/widgets/best_seller_icon/best_seller.dart';

class ProductTileWidget extends StatelessWidget {
  const ProductTileWidget(
      {Key? key,
      required this.product,
      required this.onTap,
      required this.isMostPopular,
      required this.index})
      : super(key: key);
  final dynamic product;
  final Function() onTap;
  final int index;
  final bool isMostPopular;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 8).w,
      decoration: glassDecoration,
      child: ListTile(
          title: Row(
            children: [
              Text(
                product.name,
                style: kTextLightBoldBlack,
              ),
              kWidth30,
              isMostPopular
                  ? index == 0
                      ? bestSeller()
                      : const SizedBox()
                  : const SizedBox(),
            ],
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
