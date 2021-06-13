import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:university_helper/app/data/models/university.dart';
import 'package:university_helper/app/mixin/print_log_mixin.dart';
import 'package:university_helper/app/utils/constants.dart';

class FirebaseService with PrintLogMixin {
  final dataRef =
      FirebaseFirestore.instance.collection(FirebaseCollection.MAIN_COLLECTION);
  late var data;
  DocumentSnapshot<Object?>? _lastDocs;

  Future<List<University>> searchUniversity(String? query) async {
    final listQuery = await dataRef
        .where(FirebaseField.KEYWORD, arrayContains: query)
        .limit(5)
        .get();
    final list = University.fromDatabase(listQuery.docs);
    print(list);
    return list;
  }

  Future fetchData({required int count, required String orderBy}) async {
    if (_lastDocs == null) {
      if (orderBy != TabBarOptions.NATIONAL_UNIVERSITY) {
        data =
            await dataRef.orderBy(orderBy, descending: true).limit(count).get();
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
    _lastDocs = await data.docs.last;
  }

  Future fetchAndSetData({int count = 3, required String orderBy}) async {
    await fetchData(count: count, orderBy: orderBy);

    final listDataUniversity = University.fromDatabase(data.docs);

    data = null;
    return listDataUniversity;
    //_listUniversity.addAll(listDataUniversity);
  }

  void reset() {
    _lastDocs = null;
    data = null;
  }
}
