import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restro_pro/common/constants.dart';

Widget buildCounter(Function() fnctn, IconData icon) => GestureDetector(
      onTap: fnctn,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: kDeepSpaceSparkle)),
        height: 30.h,
        width: 30.72.w,
        child: Center(
          child: Icon(icon),
        ),
      ),
    );
