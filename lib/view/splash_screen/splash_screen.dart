import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:restro_pro/common/common.dart';
import 'package:restro_pro/view/home_page/home_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      timerSplash();
    });
    return Scaffold(
      backgroundColor: kWhite,
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Center(
          child: Image.asset("assets/images/splash.gif"),
        ),
      ),
    );
  }

  timerSplash() async {
    Future.delayed(
      const Duration(seconds: 4),
    ).then((value) => Get.offAll(() => const HomePageScreen(),
        transition: Transition.rightToLeft,
        duration: const Duration(milliseconds: 400)));
  }
}
