import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:restro_pro/model/hive_model/hive_model_order.dart';
import 'package:restro_pro/model/product_model/product_model.dart';
import 'package:restro_pro/model/category_model/category_model.dart';

class ItemController extends GetxController {
  List<CategoryModel> itemModel = [];
  List<ProductModel> category = [];
  Map<String, dynamic> data = {};
  RxList<dynamic> cartProducts = <dynamic>[].obs;
  RxList<OrderModel> orderBox = <OrderModel>[].obs;
  RxDouble total = 0.0.obs;
  final RxList<OrderModel> mostpopular = <OrderModel>[].obs;
  RxList<dynamic> mostPopularSorted = <dynamic>[].obs;
  RxList<dynamic> orders = <dynamic>[].obs;
  final box = Hive.box("history");
  final map = {};

  mostPopular() async {
    for (var elements in orders.cast<OrderModel>()) {
      if (map.containsKey(elements.name)) {
        OrderModel temp = map[elements.name];

        if (mostpopular.contains(map[elements.name])) {
          mostpopular.remove(map[elements.name]);
        }
        map[elements.name] = OrderModel(
            name: elements.name,
            price: elements.price,
            quantity: elements.quantity! + temp.quantity!,
            purchaseCount: elements.purchaseCount);

        mostpopular.add(map[elements.name] as OrderModel);
      } else {
        map[elements.name] = OrderModel(
            name: elements.name,
            price: elements.price,
            quantity: elements.quantity,
            purchaseCount: 1);
        mostpopular.add(map[elements.name] as OrderModel);
      }
    }

    mostpopular.sort(
      (a, b) {
        return a.quantity!.compareTo(b.quantity!);
      },
    );
    mostPopularSorted.value = mostpopular.reversed.toList();
    await box.put("mostPopular", mostPopularSorted.value);
    mostPopularSorted.value = await box.get('mostPopular') as List<dynamic>;
  }

  mapOrder() async {
    for (var element in cartProducts.value) {
      orderBox.add(OrderModel(
          name: element.name,
          price: element.price,
          purchaseCount: 1,
          quantity: element.quantity));
    }
    var temp = box.get("orders") as List<dynamic>;
    for (var element in orderBox) {
      temp.add(element);
    }
    await box.put("orders", temp);
    orderBox.clear();
    cartProducts.clear();
    totalPrice();

    getPreviousOrders();

    update();
  }

  getPreviousOrders() async {
    var orderKeys = box.keys.toList();
    if (!orderKeys.contains("orders")) {
      List<dynamic> orders = [];
      await box.put("orders", orders);
    }
    orders.value = box.get("orders")!;
    await mostPopular();
    mostpopular.clear();
    map.clear();
  }

  totalPrice() {
    total.value = 0;
    for (var element in cartProducts) {
      var temp = element.price * element.quantity;
      total.value = total.value + temp;
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

  @override
  void onInit() {
    getPreviousOrders();
    super.onInit();
  }
}
