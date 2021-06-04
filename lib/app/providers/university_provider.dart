import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:university_helper/app/models/university.dart';
import 'package:university_helper/app/utils/constants.dart';

class UniversityProvider extends ChangeNotifier {
  List<University> _listUniversity = [];
  List<University> get listUniversity => _listUniversity;
  DocumentSnapshot<Object?>? _lastDocs;
  late var data;

  bool isReachedEnd = false;
  void reset() {
    _listUniversity.clear();
    _lastDocs = null;
    data = null;
    isReachedEnd = false;
    notifyListeners();
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
        isReachedEnd = true;
        Get.snackbar('Warning', 'Đã hết trường Đại học',
            snackPosition: SnackPosition.BOTTOM);
      }

      _lastDocs = await data.docs.last;
    } catch (e) {
      throw e;
    }
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
    notifyListeners();
  }
}
