import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:university_helper/app/services/firebase_service.dart';

enum Popular {
  Major,
  University,
}

class PopularDetailController extends GetxController {
  var _list = [].obs;
  get list => _list;
  var isLoading = false.obs;
  var isLoadMore = false.obs;

  FirebaseService firebaseService = FirebaseService();

  late ScrollController scrollCtl;

  void loading() {
    if (_list.isEmpty) {
      isLoading.value = true;
    } else {
      isLoading.value = false;
    }
    isLoadMore.value = !isLoadMore.value;
  }

  Future fetchAndSetMajorData() async {
    _list.addAll(await firebaseService.fetchMajorData(kindOfMajor: Major.Hot));
    print(_list.length);
  }

  Future fetchAndSetUniversityData() async {
    _list.addAll(await firebaseService.fetchUniversityData(orderBy: 'Hot'));
  }

  Future fetchAndSetData(Popular popular) async {
    switch (Get.arguments) {
      case Popular.Major:
        fetchAndSetMajorData();
        break;
      case Popular.University:
        fetchAndSetUniversityData();
        break;
    }
  }

  @override
  void onInit() {
    fetchAndSetData(Get.arguments);

    super.onInit();
    scrollCtl = ScrollController();

    scrollCtl.addListener(() {
      final scrollPosition = scrollCtl.position;
      print(scrollPosition.pixels.toString() +
          '=' +
          scrollPosition.maxScrollExtent.toString());
      if (scrollPosition.pixels == scrollPosition.maxScrollExtent) {
        fetchAndSetData(Get.arguments);
      }
    });
  }

  @override
  void onClose() {
    super.onClose();
    scrollCtl.dispose();
  }
}
