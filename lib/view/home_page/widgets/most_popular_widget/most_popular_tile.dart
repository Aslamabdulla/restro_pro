import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restro_pro/common/common.dart';
import 'package:restro_pro/common/constants.dart';
import 'package:restro_pro/dependency/dependency.dart';
import 'package:restro_pro/view/product_tile_widget/product_tile.dart';

class MostPopularWidget extends StatelessWidget {
  const MostPopularWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        decoration: glassDecoration,
        child: ExpansionTile(
          collapsedTextColor: kBlack,
          collapsedIconColor: kBlack,
          iconColor: kDakred,
          textColor: kDakred,
          controlAffinity: ListTileControlAffinity.leading,
          title: const Text(
            "MOST POPULAR",
            style: kTextBoldBlack,
          ),
          children:
              List.generate(itemController.mostPopularSorted.length, (index) {
            return index < 3
                ? ProductTileWidget(
                    isMostPopular: true,
                    index: index,
                    product: itemController.mostPopularSorted[index],
                    onTap: () {
                      itemController.mostPopularSorted[index].quantity = 1;
                      if (itemController.cartProducts
                          .contains(itemController.mostPopularSorted[index])) {
                      } else {
                        itemController.cartProducts
                            .add(itemController.mostPopularSorted[index]);
                        itemController.totalPrice();
                      }
                    },
                  )
                : const SizedBox();
          }),
        ),
      ),
    );
  }
}
