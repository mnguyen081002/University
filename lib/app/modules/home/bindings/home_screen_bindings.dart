import 'package:get/get.dart';
import 'package:university_helper/app/modules/home/controllers/home_screen_controller.dart';

class HomeScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeScreenController>(
      () => HomeScreenController(),
    );
  }
}
