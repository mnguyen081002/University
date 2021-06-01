import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:university_helper/models/university.dart';

class DataUniversityProvider extends ChangeNotifier {
  List<University> _listUniversity = [];
  List<University> get listUniversity => _listUniversity;
  DocumentSnapshot<Object?>? _lastDocs;

  University getById(String id) =>
      _listUniversity.firstWhere((element) => element.id == id);

  List<University> searchUniversity(String? query) {
    print(query);
    return [
      ..._listUniversity.where((element) =>
          element.name.toLowerCase().contains(query!.toLowerCase()))
    ];
  }

  Future fetchData(int count) async {
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
          .limit(6)
          .get();
    }

    _lastDocs = dataRef.docs.last;
    return dataRef;
  }

  Future fetchAndSetData({int count = 6}) async {
    final dataRef = await fetchData(count);

    final listDataUniversity = University.fromDatabase(dataRef.docs);

    _listUniversity.addAll(listDataUniversity);
    notifyListeners();
  }
}
