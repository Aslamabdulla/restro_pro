import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:restro_pro/common/common.dart';
import 'package:restro_pro/common/constants.dart';
import 'package:restro_pro/dependency/dependency.dart';
import 'package:restro_pro/view/product_tile_widget/product_tile.dart';

class AnimationListTile extends StatelessWidget {
  const AnimationListTile({
    Key? key,
    required this.products,
    required this.index,
  }) : super(key: key);

  final List products;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SlideAnimation(
      duration: const Duration(milliseconds: 2500),
      curve: Curves.fastLinearToSlowEaseIn,
      horizontalOffset: 30,
      verticalOffset: 300.0,
      child: FlipAnimation(
        duration: const Duration(milliseconds: 3000),
        curve: Curves.fastLinearToSlowEaseIn,
        flipAxis: FlipAxis.y,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          padding: const EdgeInsets.symmetric(horizontal: 5),
          decoration: kCategoryBoxDecoration(kWhite),
          child: ExpansionTile(
            iconColor: kDakred,
            textColor: kDakred,
            subtitle: Text("${products.length.toString()} Items"),
            title: Text(itemController.itemModel[index].name.toUpperCase(),
                style: kTextBoldBlack),
            children: List.generate(products.length, (index) {
              return ProductTileWidget(
                isMostPopular: false,
                index: index,
                product: products[index],
                onTap: () {
                  if (itemController.cartProducts.contains(products[index])) {
                  } else {
                    products[index].quantity = 1;
                    itemController.cartProducts.add(products[index]);
                    itemController.totalPrice();
                  }
                },
              );
            }),
          ),
        ),
      ),
    );
  }
}
