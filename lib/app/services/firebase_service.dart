import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:university_helper/app/data/models/majors.dart';
import 'package:university_helper/app/data/models/university.dart';
import 'package:university_helper/app/mixin/print_log_mixin.dart';
import 'package:university_helper/app/utils/constants.dart';

enum Major {
  Hot,
  Normal,
}

class FirebaseService with PrintLogMixin {
  late var data;
  DocumentSnapshot<Object?>? _lastDocs;

  Future<List<QueryDocumentSnapshot>> search({
    required String query,
    required String collection,
    int count = 5,
  }) async {
    final ref = FirebaseFirestore.instance.collection(collection);
    final listQuery = await ref
        .where(FirebaseField.KEYWORD, arrayContains: query)
        .limit(count)
        .get();
    return listQuery.docs;
  }

  Future fetchUniversityData({int count = 6, required String orderBy}) async {
    final dataRef =
        FirebaseFirestore.instance.collection(FirebaseCollection.UNIVERSITY);
    final a = await dataRef.doc().get();
    print(a[0].id);
    if (_lastDocs == null) {
      //Nếu không phải đhqg thì chia page không thì fetch hết
      if (orderBy != FirebaseField.NATIONAL_UNIVERSITY) {
        data =
            await dataRef.orderBy(orderBy, descending: true).limit(count).get();
      } else {
        data = await dataRef.where(orderBy, isEqualTo: true).get();
      }
    } else if (orderBy != FirebaseField.NATIONAL_UNIVERSITY) {
      //load more
      data = await dataRef
          .orderBy(orderBy, descending: true)
          .startAfterDocument(_lastDocs!)
          .limit(3)
          .get();
    }
    //set last doc để chia page
    _lastDocs = await data.docs.last;
    final listUniversity = University.fromFirebase(data.docs);
    //reset data
    data = null;
    return listUniversity;
  }

  Future fetchMajorData({
    required Major kindOfMajor,
    int count = 3,
    bool hot = false,
  }) async {
    final dataRef =
        FirebaseFirestore.instance.collection(FirebaseCollection.MAJOR);
    if (_lastDocs == null) {
      if (!hot) {
        data = await dataRef.limit(count).get();
      } else {
        data = await dataRef.limit(count).where('isHot', isEqualTo: true).get();
      }
    } else {
      //load more
      data = await dataRef.startAfterDocument(_lastDocs!).limit(3).get();
    }

    //set last doc để chia page
    _lastDocs = await data.docs.last;
    final listMajor = Majors.fromFirebase(data.docs);
    //reset data
    data = null;
    return listMajor;
  }

  void reset() {
    _lastDocs = null;
    data = null;
  }
}
