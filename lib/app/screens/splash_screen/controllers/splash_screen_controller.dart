import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_helper/app/screens/home/home_screen.dart';

class SplashScreenController extends GetxController
    with SingleGetTickerProviderMixin {
  // animation controller for lottie
  late AnimationController animationController;

  // initializing userData instance

  @override
  void onInit() async {
    super.onInit();
    // splash animation config

    animationController = AnimationController(
      duration: Duration(seconds: 5),
      vsync: this,
    );
    animationController.forward();

    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        animationController.forward();
      }
    });
    Timer(
      Duration(milliseconds: 5000),
      () => Get.offNamed(HomeScreen.routeName),
    );
  }

  @override
  void onClose() async {
    animationController.dispose();
    super.onClose();
  }
}
