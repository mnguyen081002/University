import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:university_helper/models/majors.dart';
import 'package:university_helper/models/university.dart';

class DataUniversityProvider extends ChangeNotifier {
  List<University> _listUniversity = [];
  List<University> get listUniversity => _listUniversity;
  DocumentSnapshot<Object?>? _lastDocs;

  University getById(String id) =>
      _listUniversity.firstWhere((element) => element.id == id);

  Future fetchAndSetData() async {
    List<University> listUniversity = [];

    late final dataRef;

    if (_lastDocs == null) {
      dataRef = await FirebaseFirestore.instance
          .collection('ListUniversity')
          .limit(3)
          .get();
    } else {
      dataRef = await FirebaseFirestore.instance
          .collection('ListUniversity')
          .startAfterDocument(_lastDocs!)
          .limit(4)
          .get();
    }

    _lastDocs = dataRef.docs.last;

    final listDataUniversity = dataRef.docs;

    listDataUniversity.forEach((element) {
      final listDataMajors = element['listMajors'];

      List<Majors> listMajors = [];

      listDataMajors.forEach((majors) {
        listMajors.add(Majors(
          grade: majors['grade'] as List,
          idMajors: majors['idMajors'] as String,
          name: majors['nameMajors'] as String,
          studyTime: majors['studyTime'] as String,
        ));
      });

      listUniversity.add(
        University(
          name: element['name'],
          imageUrl: element['imageUrl'],
          formsOfTraining: element['formsOfTraining'],
          idUniversity: element['idUniversity'],
          isNationalUniversity: element['isNationalUniversity'],
          listMajors: listMajors,
          location: element['location'],
          maxTuition: element['maxTuition'].toDouble(),
          minTuition: element['minTuition'].toDouble(),
          universityType: element['universityType'],
          universityUrl: element['universityUrl'],
          id: element.id,
        ),
      );
    });

    _listUniversity.addAll(listUniversity);

    notifyListeners();
  }
}
