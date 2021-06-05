import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:university_helper/app/providers/university_provider.dart';
import 'package:university_helper/app/utils/constants.dart';

class HomeScreenController extends GetxController
    with SingleGetTickerProviderMixin {
  late ScrollController scrollController;
  var scrollPositionController = 0.0.obs;
  late Duration animatedDuration;
  late TabController tabController;
  int selectedIndex = 0;

  @override
  void onInit() {
    super.onInit();
    animatedDuration = const Duration(milliseconds: 200);
    scrollController = ScrollController();
    tabController = TabController(length: 4, vsync: this);

    scrollController.addListener(() {
      final provider = Provider.of<UniversityProvider>(context, listen: false);
      provider.fetchAndSetData(orderBy: kTabBarOptions[0]);
      final scrollPosition = scrollController.position;
      if (scrollPosition.pixels == scrollPosition.maxScrollExtent)
        provider.fetchAndSetData(orderBy: kTabBarOptions[selectedIndex]);

      if (scrollPosition.pixels <= 130) {
        scrollPositionController.value = -(scrollPosition.pixels / 2);
      }
    });

    tabController.addListener(() {
      selectedIndex = tabController.index;
      scrollPositionController.value = 0.0;

      provider.reset();

      provider.fetchAndSetData(
        count: 6,
        orderBy: kTabBarOptions[selectedIndex],
      );
    });
  }
}
