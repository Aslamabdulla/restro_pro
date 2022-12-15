// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:restro_pro/common/common.dart';

Widget addButtonWidget() => Material(
      elevation: 3,
      borderRadius: kBorderRadiusButton,
      color: const Color.fromRGBO(224, 224, 224, 1),
      child: Container(
        clipBehavior: Clip.antiAlias,
        height: 50,
        width: 100,
        decoration: BoxDecoration(
            borderRadius: kBorderRadiusButton,
            border: Border.all(width: 1, color: kBlack.withOpacity(.1))),
        child: const Center(
          child: Text(
            "Add",
            style: TextStyle(
                fontWeight: FontWeight.w800, color: kDeepSpaceSparkle),
          ),
        ),
      ),
    );
