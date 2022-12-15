import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:restro_pro/model/hive_model/hive_model_order.dart';
import 'package:restro_pro/model/product_model.dart';
import 'package:restro_pro/model/category_model.dart';

class ItemController extends GetxController {
  List<CategoryModel> itemModel = [];
  List<ProductModel> category = [];
  Map<String, dynamic> data = {};
  RxBool isExpanded = true.obs;
  RxList<ProductModel> cartProducts = <ProductModel>[].obs;
  RxList<OrderModel> orderBox = <OrderModel>[].obs;
  RxDouble total = 0.0.obs;

  mapOrder(ProductModel product, int qty) async {
    orderBox.add(OrderModel(
        name: product.name,
        price: product.price,
        purchaseCount: 0,
        quantity: qty));
  }

  totalPrice() {
    total.value = 0;
    for (var element in cartProducts) {
      var temp = element.price * element.quantity;

      total.value = total.value + temp;
    }
  }

  addCategory() {
    for (var element in itemModel) {
      // element.cat.forEach((element) {
      //   final temp = element as Map<String, dynamic>;
      //   print(temp);
      // }
      // );
      // final temp = CategoryModel.fromMap(element.cat as Map<String, dynamic>);
      final temp1 = element.cat.map((e) => e as Map<String, dynamic>).toList();
      print(temp1);
    }
  }

  Future<void> readJson() async {
    final String response = await rootBundle.loadString("assets/menu.json");
    final data = await json.decode(response) as Map<String, dynamic>;

    data.forEach((key, value) {
      final temp = CategoryModel(cat: value, name: key);
      itemModel.add(temp);
    });
  }
}
