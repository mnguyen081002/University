import 'package:get/get.dart';
import 'package:university_helper/app/modules/popular/controllers/popular_screen_controller.dart';

class PopularDetailScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PopularScreenController>(
      () => PopularScreenController(),
    );
  }
}
