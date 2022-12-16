import 'dart:convert';

import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  String name;
  num price;
  bool instock;
  int quantity;
  ProductModel({
    required this.name,
    required this.price,
    required this.instock,
    required this.quantity,
  });

  ProductModel copyWith({
    String? name,
    num? price,
    bool? instock,
    int? quantity,
  }) {
    return ProductModel(
      name: name ?? this.name,
      price: price ?? this.price,
      instock: instock ?? this.instock,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'price': price,
      'instock': instock,
      'quantity': quantity,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      name: map['name'] as String,
      price: map['price'] as num,
      instock: map['instock'] as bool,
      quantity: 1 as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [name, price, instock, quantity];
}
