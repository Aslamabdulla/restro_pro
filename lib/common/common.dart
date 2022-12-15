import 'package:flutter/material.dart';

const kWhite = Colors.white;
const kBlack = Colors.black;
const kred = Colors.red;
const kDakred = Color.fromRGBO(191, 49, 0, 1);
const kRedVermilion = Color.fromRGBO(233, 25, 15, 1);
const kOrangeSoda = Color.fromRGBO(249, 87, 56, 1);
const kDeepSpaceSparkle = Color.fromRGBO(58, 96, 110, 1);
const kDarkPastalGreen = Color.fromRGBO(76, 185, 68, 1);
const kTextBold = TextStyle(fontWeight: FontWeight.w800);
const kTextLightBold = TextStyle(fontWeight: FontWeight.w600);
const kTextMedium = TextStyle(
    fontWeight: FontWeight.w500, color: Color.fromRGBO(35, 31, 32, .8));
final kBorderRadiusButton = BorderRadius.circular(20);

const kWidth5 = SizedBox(
  width: 5,
);
const kWidth10 = SizedBox(
  width: 10,
);
const kClipperBgOrange = Color.fromRGBO(255, 174, 3, .7);
const textHomeHeadStyle = TextStyle(fontWeight: FontWeight.w800, color: kBlack);
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
