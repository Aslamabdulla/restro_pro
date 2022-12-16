import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:restro_pro/common/common.dart';
import 'package:restro_pro/common/constants.dart';

Widget addButtonWidget() => Material(
      elevation: 3,
      borderRadius: kBorderRadiusButton,
      color: kLightGrey,
      child: Container(
        clipBehavior: Clip.antiAlias,
        height: 50.h,
        width: 100.w,
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
