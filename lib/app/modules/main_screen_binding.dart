import 'package:get/get.dart';
import 'package:university_helper/app/modules/home/controllers/home_screen_controller.dart';
import 'package:university_helper/app/modules/search/controllers/search_controller.dart';

import 'main_screen_controller.dart';

class MainScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainScreenController>(
      () => MainScreenController(),
    );
    Get.lazyPut<HomeScreenController>(
      () => HomeScreenController(),
    );
    Get.lazyPut<SearchScreenController>(
      () => SearchScreenController(),
    );
  }
}
