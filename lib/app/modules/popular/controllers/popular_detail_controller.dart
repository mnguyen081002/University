import 'package:get/get.dart';
import 'package:university_helper/app/services/firebase_service.dart';

enum Popular {
  Major,
  University,
}

class PopularDetailController extends GetxController {
  var _list = [];
  get list => _list;
  var isLoading = false.obs;
  var isLoadMore = false.obs;
  FirebaseService firebaseService = FirebaseService();
  Future fetchAndSetMajorData() async {
    isLoading.value = true;

    _list.addAll(await firebaseService.fetchMajorData(kindOfMajor: Major.Hot));
    print(_list.length);
    isLoading.value = false;
  }

  Future fetchAndSetUniversityData() async {
    isLoading.value = true;

    _list.addAll(await firebaseService.fetchUniversityData(orderBy: 'Hot'));
    isLoading.value = false;
  }

  @override
  void onInit() {
    super.onInit();
    switch (Get.arguments) {
      case Popular.Major:
        fetchAndSetMajorData();
        break;
      case Popular.University:
        fetchAndSetUniversityData();
        break;
    }
  }
}
