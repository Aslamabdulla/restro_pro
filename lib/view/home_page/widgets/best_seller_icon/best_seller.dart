import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restro_pro/common/common.dart';
import 'package:restro_pro/common/constants.dart';

Widget bestSeller() => Container(
      height: 20.h,
      width: 65.w,
      decoration: BoxDecoration(
        color: fireOpelRed,
        borderRadius: kBorderRadiusButton,
      ),
      child: Center(
        child: Text(
          "Best Seller",
          style: TextStyle(color: kWhite, fontSize: 8.sp),
        ),
      ),
    );
