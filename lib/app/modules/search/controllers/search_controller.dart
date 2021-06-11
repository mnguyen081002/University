import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_helper/app/data/models/university.dart';
import 'package:university_helper/app/utils/constants.dart';

class SearchScreenController extends GetxController
    with SingleGetTickerProviderMixin {
  RxList<dynamic> _listUniversity = [].obs;

  final isScrollLoading = false.obs;
  final isLoading = false.obs;
  final isReachedEnd = false.obs;
  final isSearchByMajors = true.obs;
  final scrollPositionController = 0.0.obs;
  final selectedIndex = 0.obs;

  get listUniversity => _listUniversity;
  DocumentSnapshot<Object?>? _lastDocs;

  late var data;
  late final ScrollController scrollController;
  late final Duration animatedDuration;
  late final TabController tabController;

  void reset() {
    _listUniversity.clear();
    _lastDocs = null;
    data = null;
    isReachedEnd.value = false;
    update();
  }

  University getById(String id) =>
      _listUniversity.firstWhere((element) => element.id == id);

  Future<List<University>> searchUniversity(String? query) async {
    final dataRef = FirebaseFirestore.instance.collection('ListUniversity');
    final listQuery =
        await dataRef.where('keyword', arrayContains: query).limit(5).get();
    final list = University.fromDatabase(listQuery.docs);
    print(list);
    return list;
  }

  Future fetchData({required int count, required String orderBy}) async {
    isScrollLoading.value = true;

    try {
      final dataRef = FirebaseFirestore.instance.collection('ListUniversity');
      if (_lastDocs == null) {
        isLoading.value = true;
        if (orderBy != TabBarOptions.NATIONAL_UNIVERSITY) {
          data = await dataRef
              .orderBy(orderBy, descending: true)
              .limit(count)
              .get();
        } else {
          data = await dataRef.where(orderBy, isEqualTo: true).get();
        }
      } else if (orderBy != TabBarOptions.NATIONAL_UNIVERSITY) {
        data = await dataRef
            .orderBy(orderBy, descending: true)
            .startAfterDocument(_lastDocs!)
            .limit(3)
            .get();
      }

      if ((data.docs.isEmpty || data == null) && _listUniversity.isNotEmpty) {
        isReachedEnd.value = true;
        Get.snackbar('Warning', 'Đã hết trường Đại học',
            snackPosition: SnackPosition.BOTTOM);
      }

      _lastDocs = await data.docs.last;
    } catch (e) {
      isScrollLoading.value = false;
      isLoading.value = false;
      print(e);
      throw e;
    }
    isLoading.value = false;
    isScrollLoading.value = false;
  }

  Future fetchAndSetData({int count = 3, required String orderBy}) async {
    await fetchData(count: count, orderBy: orderBy);

    final listDataUniversity = University.fromDatabase(data.docs);

    data = null;
    _listUniversity.addAll(listDataUniversity);
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
        print(scrollPosition.pixels);

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
