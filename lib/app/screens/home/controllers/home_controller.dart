import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_helper/app/models/university.dart';
import 'package:university_helper/app/utils/constants.dart';

class HomeScreenController extends GetxController
    with SingleGetTickerProviderMixin {
  var _listUniversity = [].obs;
  var isLoading = false.obs;
  var isReachedEnd = false.obs;
  var isSearchByMajors = true.obs;
  var scrollPositionController = 0.0.obs;
  var selectedIndex = 0.obs;

  get listUniversity => _listUniversity;
  DocumentSnapshot<Object?>? _lastDocs;

  late var data;
  late ScrollController scrollController;
  late Duration animatedDuration;
  late TabController tabController;

  void reset() {
    _listUniversity.clear();
    _lastDocs = null;
    data = null;
    isReachedEnd.value = false;
    update();
  }

  University getById(String id) =>
      _listUniversity.firstWhere((element) => element.id == id);

  List<University> searchUniversity(String? query) {
    return [
      ..._listUniversity.where((element) =>
          element.name.toLowerCase().contains(query!.toLowerCase()))
    ];
  }

  Future fetchData({required int count, required String orderBy}) async {
    isLoading.value = true;

    try {
      final dataRef = FirebaseFirestore.instance.collection('ListUniversity');
      if (_lastDocs == null) {
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

      if (data.docs.isEmpty || data == null) {
        isReachedEnd.value = true;
        Get.snackbar('Warning', 'Đã hết trường Đại học',
            snackPosition: SnackPosition.BOTTOM);
      }

      _lastDocs = await data.docs.last;
    } catch (e) {
      throw e;
    }
    isLoading.value = false;
  }

  Future fetchAndSetData({int count = 3, required String orderBy}) async {
    await fetchData(count: count, orderBy: orderBy);

    final listDataUniversity = University.fromDatabase(data.docs);

    data = null;
    _listUniversity.addAll(listDataUniversity);
    //ToDo check data from firebase
    // listDataUniversity.forEach((element) {
    //   print(
    //     element.name + ':' + element.maxTuition.toString(),
    //   );
    // });
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
      //load more cua em o day
      if (scrollPosition.pixels == scrollPosition.maxScrollExtent)
        //ham nay la em lay data tu firebase
        fetchAndSetData(orderBy: kTabBarOptions[selectedIndex.value]);

      if (scrollPosition.pixels <= 130) {
        scrollPositionController.value = -(scrollPosition.pixels / 2);
      }
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
