import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:university_helper/app/theme/color_theme.dart';
import 'package:university_helper/app/theme/text_theme.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: GetBuilder<SplashScreenController>(builder: (_) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Lottie.asset(
                  'assets/lottie/online-study.json',
                  fit: BoxFit.cover,
                  controller: _.animationController,
                  frameRate: FrameRate(60),
                  repeat: true,
                  onLoaded: (composition) {
                    _.animationController..duration = composition.duration;
                  },
                ),
              ),
              AnimatedOpacity(
                duration: _.textAnimationController.duration!,
                opacity: _.textAnimationController.value,
                child: Text(
                  'University',
                  style: kSplashTextStyle.copyWith(
                    color: primaryGrey,
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
