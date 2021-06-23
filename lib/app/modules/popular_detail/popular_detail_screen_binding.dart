import 'package:get/get.dart';
import 'package:university_helper/app/modules/popular_detail/popular_detail_controller.dart';

class PopularDetailScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PopularDetailScreenController>(
      () => PopularDetailScreenController(),
    );
  }
}
