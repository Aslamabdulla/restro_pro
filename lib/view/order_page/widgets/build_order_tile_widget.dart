import 'package:flutter/material.dart';
import 'package:restro_pro/common/common.dart';
import 'package:restro_pro/common/constants.dart';

Container buildOrderTileWidget(List<dynamic> products, int index) {
  return Container(
    decoration: glassDecoration,
    padding: const EdgeInsets.all(8),
    margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
    child: ListTile(
      title: Text(
        products[index].name,
        style: const TextStyle(fontSize: 15),
      ),
      subtitle: Row(
        children: [
          Text(
            "₹${products[index].price.toString()}",
            style: kTextLightBoldBlack,
          ),
          kWidth10,
          Text("Qty : ${products[index].quantity}"),
        ],
      ),
      trailing: Material(
        elevation: 2,
        borderRadius: kBorderRadiusButton,
        child: Container(
          height: 50,
          width: 100,
          decoration: BoxDecoration(
              border: Border.all(width: .4, color: kBlack.withOpacity(.5)),
              color: kLightGrey,
              borderRadius: kBorderRadiusButton),
          child: Center(
            child: Text(
                "Total ${(products[index].quantity * products[index].price)}"),
          ),
        ),
      ),
    ),
  );
}
