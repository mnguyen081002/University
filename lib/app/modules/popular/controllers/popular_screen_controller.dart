import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:university_helper/app/services/firebase_service.dart';
import 'package:university_helper/app/utils/enum.dart';

class PopularScreenController extends GetxController {
  final _list = [].obs;
  get list => _list;
  final isLoading = false.obs;
  final isLoadMore = false.obs;
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
    print(_list.length.toString() + ' item in list - PopularController');
  }

  Future fetchAndSetUniversityData() async {
    _list.addAll(await firebaseService.fetchUniversityData(orderBy: 'Hot'));
  }

  Future fetchAndSetData(Collection popular) async {
    isLoading.value = true;

    switch (popular) {
      case Collection.Major:
        await fetchAndSetMajorData();
        break;
      case Collection.University:
        await fetchAndSetUniversityData();
        break;
    }
    isLoading.value = false;
  }

  @override
  void onInit() {
    title = Get.arguments['title'];
    urlAppbar = Get.arguments['urlAppbar'];
    final popular = Get.arguments['popular'];

    fetchAndSetData(popular);

    super.onInit();
    scrollCtl = ScrollController();
    scrollCtl.addListener(() {
      final scrollPosition = scrollCtl.position;

      if (scrollPosition.pixels == scrollPosition.maxScrollExtent) {
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
