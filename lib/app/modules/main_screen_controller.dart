import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreenController extends GetxController
    with SingleGetTickerProviderMixin {
  RxInt bottomNavIndex = 3.obs; //default index of a first screen
  final IconData floatButtonIcon = Icons.home;
  final labelList = <String>[
    'Tìm',
    'Tiện ích',
    'Cá Nhân',
  ];
  RxBool isActive = true.obs;

  final iconList = <IconData>[
    Icons.search_sharp,
    Icons.auto_awesome,
    Icons.person,
  ];
  void onPressFloatBtn() {
    bottomNavIndex.value = 3;
    isActive.value = true;
  }

  void onTapItemBottomBar(int index) {
    print(index.toString() + 'onTapItemBottomBar');
    bottomNavIndex.value = index;
  }
}
