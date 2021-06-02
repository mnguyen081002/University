import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_helper/app/screens/home/home_screen.dart';

class SplashScreenController extends GetxController
    with SingleGetTickerProviderMixin {
  // animation controller for lottie
  late AnimationController animationController;
  late AnimationController textAnimationController;

  // initializing userData instance

  @override
  void onInit() async {
    super.onInit();
    // splash animation config

    animationController = AnimationController(
      duration: Duration(milliseconds: 2500),
      vsync: this,
    );
    textAnimationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    animationController.value.obs;

    animationController.forward();

    textAnimationController.forward();

    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        animationController.forward();
      }
    });
    Timer(
      Duration(milliseconds: 5500),
      () => Get.offNamed(HomeScreen.routeName),
    );
  }

  @override
  void onClose() async {
    animationController.dispose();
    textAnimationController.dispose();
    super.onClose();
  }
}
