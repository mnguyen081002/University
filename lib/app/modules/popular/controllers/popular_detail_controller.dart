import 'package:get/get.dart';
import 'package:university_helper/app/services/firebase_service.dart';

enum Popular {
  Major,
  University,
}

class PopularDetailController extends GetxController {
  var _list = [].obs;
  get list => _list;
  FirebaseService firebaseService = FirebaseService();
  Future fetchAndSetMajorData() async {
    _list.addAll(await firebaseService.fetchMajorData(kindOfMajor: Major.Hot));
    print(_list.length);
  }

  Future fetchAndSetUniversityData() async {
    _list.addAll(await firebaseService.fetchUniversityData(orderBy: 'Hot'));
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
