import 'package:flutter/material.dart';
import 'package:restro_pro/common/common.dart';
import 'package:restro_pro/common/constants.dart';

class DialogueButton extends StatelessWidget {
  const DialogueButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: kBorderRadiusButton,
      elevation: 2,
      child: Container(
        height: 50,
        width: 100,
        decoration: BoxDecoration(
            color: kClipperBgOrange, borderRadius: kBorderRadiusButton),
        child: const Center(
          child: Text(
            "OK",
            style: kTextBoldBlack,
          ),
        ),
      ),
    );
  }
}
