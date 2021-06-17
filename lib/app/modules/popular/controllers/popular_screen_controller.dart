import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:university_helper/app/services/firebase_service.dart';

enum Popular {
  Major,
  University,
}

class PopularScreenController extends GetxController {
  var _list = [].obs;
  get list => _list;
  var isLoading = false.obs;
  var isLoadMore = false.obs;
  late final String title;
  late final String urlAppbar;
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
    _list.addAll(
      await firebaseService.fetchMajorData(
        kindOfMajor: Major.Hot,
        hot: true,
      ),
    );
    print(_list.length);
  }

  Future fetchAndSetUniversityData() async {
    _list.addAll(await firebaseService.fetchUniversityData(orderBy: 'Hot'));
  }

  Future fetchAndSetData(Popular popular) async {
    switch (popular) {
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
    title = Get.arguments['title'];
    urlAppbar = Get.arguments['urlAppbar'];
    final popular = Get.arguments['popular'];
    fetchAndSetData(popular);

    super.onInit();
    scrollCtl = ScrollController();
    print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
    scrollCtl.addListener(() {
      final scrollPosition = scrollCtl.position;
      print('bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb');

      if (scrollPosition.pixels == scrollPosition.maxScrollExtent) {
        print('bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb');
        fetchAndSetData(popular);
      }
    });
  }

  @override
  void onClose() {
    super.onClose();
    scrollCtl.dispose();
  }
}
