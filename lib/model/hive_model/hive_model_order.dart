// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';

part 'hive_model_order.g.dart';

@HiveType(typeId: 0)
class OrderModel extends HiveObject {
  @HiveField(0)
  String? name;
  @HiveField(1)
  num? price;
  @HiveField(2)
  int? quantity;
  @HiveField(3)
  int? purchaseCount;
  @HiveField(4)
  bool instock = true;
  OrderModel({
    this.name,
    this.price,
    this.quantity,
    this.purchaseCount,
  });
}

// String boxName = "orders";

// class OrderBox {
//   static Box<List>? _box;
//   static Box<List> getInstance() {
//     return _box ??= Hive.box(boxName);
//   }
// }
