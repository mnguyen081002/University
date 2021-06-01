import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:university_helper/models/university.dart';

class UniversityProvider extends ChangeNotifier {
  List<University> _listUniversity = [];
  List<University> get listUniversity => _listUniversity;
  DocumentSnapshot<Object?>? _lastDocs;

  University getById(String id) =>
      _listUniversity.firstWhere((element) => element.id == id);

  List<University> searchUniversity(String? query) {
    return [
      ..._listUniversity.where((element) =>
          element.name.toLowerCase().contains(query!.toLowerCase()))
    ];
  }

  Future fetchData(int count) async {
    late final data;

    final dataRef = FirebaseFirestore.instance.collection('ListUniversity');

    if (_lastDocs == null) {
      data = await dataRef
          .orderBy("maxTuition", descending: true)
          .limit(count)
          .get();
    } else {
      data = await dataRef
          .orderBy("maxTuition", descending: true)
          .startAfterDocument(_lastDocs!)
          .limit(1)
          .get();
    }

    _lastDocs = await data.docs.last;
    return data;
  }

  Future fetchAndSetData({int count = 3}) async {
    final data = await fetchData(count);

    final listDataUniversity = University.fromDatabase(data.docs);

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
