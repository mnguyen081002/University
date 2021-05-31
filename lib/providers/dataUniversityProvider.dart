import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:university_helper/models/university.dart';

class DataUniversityProvider extends ChangeNotifier {
  List<University> _listUniversity = [];
  List<University> get listUniversity => _listUniversity;
  DocumentSnapshot<Object?>? _lastDocs;

  University getById(String id) =>
      _listUniversity.firstWhere((element) => element.id == id);

  Future fetchAndSetData({int count = 5}) async {
    List<University> listUniversity = [];

    late final dataRef;

    if (_lastDocs == null) {
      dataRef = await FirebaseFirestore.instance
          .collection('ListUniversity')
          .limit(count)
          .get();
    } else {
      dataRef = await FirebaseFirestore.instance
          .collection('ListUniversity')
          .startAfterDocument(_lastDocs!)
          .limit(1)
          .get();
    }

    _lastDocs = dataRef.docs.last;

    final listDataUniversity = dataRef.docs;

    listDataUniversity.forEach((element) {
      listUniversity.add(University.fromJson(element));
    });

    _listUniversity.addAll(listUniversity);

    notifyListeners();
  }
}
