// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:restro_pro/dependency/dependency.dart';
import 'package:restro_pro/model/product_model/product_model.dart';
import 'package:restro_pro/view/home_page/widgets/category_widget/widgets/animation_list_tile.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: itemController.itemModel.length,
        itemBuilder: (context, index) {
          final List<dynamic> products = [];
          final temp1 = itemController.itemModel[index].cat
              .map((e) => e as Map<String, dynamic>)
              .toList();

          temp1.map((product) {
            if (product["instock"] == true) {
              products.add(ProductModel.fromMap(product));
            }
          }).toList();

          return AnimationConfiguration.staggeredList(
            position: index,
            delay: const Duration(milliseconds: 100),
            child: AnimationListTile(products: products, index: index),
          );
        },
      ),
    );
  }
}
