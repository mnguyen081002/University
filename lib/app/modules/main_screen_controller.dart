import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class MainScreenController extends GetxController {
  RxInt bottomNavIndex = 3.obs; //default index of a first screen
  final IconData floatButtonIcon = Icons.home;
  final labelList = <String>[
    'Tìm',
    'Tiện ích',
    'Cá Nhân',
  ];
  RxBool isActive = true.obs;
  late PersistentTabController tabController;

  final iconList = [
    Icons.location_city_sharp,
    Icons.school,
    Icons.auto_awesome,
  ];
  void onPressFloatBtn() {
    bottomNavIndex.value = 3;
    isActive.value = true;
  }

  void onTapItemBottomBar(int index) {
    print(index.toString() + ' - onTapItemBottomBar');
    bottomNavIndex.value = index;
  }

  @override
  void onInit() {
    tabController = PersistentTabController(initialIndex: 0);
    super.onInit();
  }
}
