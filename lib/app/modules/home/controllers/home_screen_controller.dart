import 'package:get/get.dart';
import 'package:university_helper/app/services/firebase_service.dart';
import 'package:university_helper/app/utils/constants.dart';

class HomeScreenController extends GetxController {
  FirebaseService firebaseService = FirebaseService();
  var _listUniversity = [].obs;
  get listUniversity => _listUniversity;

  Future fetchAndSetData({int count = 5, required String orderBy}) async {
    try {
      final list = await firebaseService.fetchUniversityData(
          count: count, orderBy: orderBy);
      _listUniversity.addAll(list);
    } catch (e) {
      print(e);
      throw e;
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    fetchAndSetData(count: 5, orderBy: FirebaseField.RATE);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
