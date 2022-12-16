import 'package:flutter/material.dart';
import 'package:restro_pro/common/constants.dart';

////////////////Box Decoration////////////////////////
final kBorderRadiusButton = BorderRadius.circular(20);
var borderRadius = const BorderRadius.only(
    topRight: Radius.circular(32), bottomRight: Radius.circular(32));
final glassDecoration = BoxDecoration(
    image: const DecorationImage(
        image: AssetImage("assets/images/noise.png"),
        fit: BoxFit.cover,
        opacity: .07),
    border: Border.all(width: .5, color: kBlack.withOpacity(.3)),
    borderRadius: BorderRadius.circular(20),
    gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomCenter,
        colors: [Colors.white60, Colors.white12]));
final kButtonDecoration = BoxDecoration(
    color: kClipperBgOrange, borderRadius: BorderRadius.circular(10));
kCategoryBoxDecoration(Color bgColor) => BoxDecoration(
      color: bgColor,
      borderRadius: const BorderRadius.all(
        Radius.circular(20),
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(.5),
          blurRadius: 2,
          spreadRadius: 0,
        ),
      ],
    );
