import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_helper/app/data/models/university.dart';
import 'package:university_helper/app/services/firebase_service.dart';
import 'package:university_helper/app/utils/constants.dart';

class SearchScreenController extends GetxController
    with SingleGetTickerProviderMixin {
  RxList<dynamic> _listUniversity = [].obs;
  FirebaseService firebaseService = FirebaseService();

  final isScrollLoading = false.obs;
  final isLoading = false.obs;
  final isReachedEnd = false.obs;
  final isSearchByMajors = true.obs;
  final scrollPositionController = 0.0.obs;
  final selectedIndex = 0.obs;

  get listUniversity => _listUniversity;

  late final ScrollController scrollController;
  late final Duration animatedDuration;
  late final TabController tabController;

  void reset() {
    firebaseService.reset();
    _listUniversity.clear();
    isReachedEnd.value = false;
    update();
  }

  University getById(String id) =>
      _listUniversity.firstWhere((element) => element.id == id);

  Future<List<University>> searchUniversity(String? query) async {
    return await firebaseService.searchUniversity(query);
  }

  Future fetchAndSetData({int count = 3, required String orderBy}) async {
    isScrollLoading.value = true;
    isLoading.value = true;
    try {
      final list = await firebaseService.fetchAndSetData(orderBy: orderBy);
      _listUniversity.addAll(list);
      if ((firebaseService.data.docs.isEmpty || firebaseService.data == null) &&
          _listUniversity.isNotEmpty) {
        isReachedEnd.value = true;
        Get.snackbar('Warning', 'Đã hết trường Đại học',
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      isScrollLoading.value = false;
      isLoading.value = false;
      print(e);
      throw e;
    }
    isLoading.value = false;
    isScrollLoading.value = false;
  }

  @override
  void onInit() {
    fetchAndSetData(orderBy: kTabBarOptions[0]);

    super.onInit();
    animatedDuration = const Duration(milliseconds: 200);
    scrollController = ScrollController();
    tabController = TabController(length: 4, vsync: this);

    scrollController.addListener(() {
      final scrollPosition = scrollController.position;

      if (scrollPosition.pixels == scrollPosition.maxScrollExtent)
        fetchAndSetData(orderBy: kTabBarOptions[selectedIndex.value]);
      if (scrollPosition.pixels <= 130) {
        scrollPositionController.value = -(scrollPosition.pixels / 2);
      }
      if (scrollController.position.pixels <
          scrollPosition.maxScrollExtent * 0.95) isScrollLoading.value = false;
    });

    tabController.addListener(() {
      selectedIndex.value = tabController.index;
      scrollPositionController.value = 0.0;

      reset();

      fetchAndSetData(
        count: 6,
        orderBy: kTabBarOptions[selectedIndex.value],
      );
    });
  }
}
