import 'package:get/get.dart';
import 'package:university_helper/app/modules/search/controllers/search_controller.dart';

class SearchScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchScreenController>(
      () => SearchScreenController(),
    );
  }
}
