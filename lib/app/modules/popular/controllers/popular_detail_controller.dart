import 'package:get/get.dart';
import 'package:university_helper/app/services/firebase_service.dart';

class PopularDetailController extends GetxController {
  var _list = [].obs;
  get list => _list;
  FirebaseService firebaseService = FirebaseService();
  Future fetchAndSetMajorData(Major kindOfMajor) async {
    _list
        .addAll(await firebaseService.fetchMajorData(kindOfMajor: kindOfMajor));
  }

  @override
  void onInit() {
    super.onInit();
  }
}
