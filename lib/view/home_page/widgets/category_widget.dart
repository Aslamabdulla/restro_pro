import 'package:flutter/material.dart';

import 'package:restro_pro/common/common.dart';
import 'package:restro_pro/dependency/dependency.dart';
import 'package:restro_pro/model/product_model.dart';
import 'package:restro_pro/view/product_tile_widget/product_tile.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemCount: itemController.itemModel.length,
          itemBuilder: (context, index) {
            final List<ProductModel> products = [];
            final temp1 = itemController.itemModel[index].cat
                .map((e) => e as Map<String, dynamic>)
                .toList();

            temp1.map((product) {
              if (product["instock"] == true) {
                products.add(ProductModel.fromMap(product));
              }
            }).toList();

            return ExpansionTile(
              textColor: kDakred,
              subtitle: Text("${products.length.toString()} Items"),
              title: Text(itemController.itemModel[index].name.toUpperCase(),
                  style: kTextBold),
              children: List.generate(products.length, (index) {
                return ProductTileWidget(
                  product: products[index],
                  onTap: () {
                    if (itemController.cartProducts.contains(products[index])) {
                    } else {
                      itemController.cartProducts.add(products[index]);
                      itemController.totalPrice();
                    }
                  },
                );
              }),
            );
          },
          separatorBuilder: (context, index) => const Divider(),
        ),
      ),
    );
  }
}
