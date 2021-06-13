import 'package:get/get.dart';
import 'package:university_helper/app/modules/popular_university_detail/controllers/popular_detail_controller.dart';

class PopularDetailScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PopularDetailController>(
      () => PopularDetailController(),
    );
  }
}
