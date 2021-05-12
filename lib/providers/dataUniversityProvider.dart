import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:university_helper/data/majors_data.dart';
import 'package:university_helper/models/university_info.dart';

class DataUniversityProvider extends ChangeNotifier {
  List<UniversityInfo> _listUniversity = [];
  List<UniversityInfo> get listUniversity => _listUniversity;
  DocumentSnapshot<Object?>? lastDocs;
  Future fetchAndSetData() async {
    List<UniversityInfo> listUniversity = [];
    late final dataRef;
    if (lastDocs == null) {
      dataRef = await FirebaseFirestore.instance
          .collection('ListUniversity')
          .limit(1)
          .get();
    } else {
      dataRef = await FirebaseFirestore.instance
          .collection('ListUniversity')
          .startAfterDocument(lastDocs!)
          .limit(4)
          .get();
    }
    lastDocs = dataRef.docs.last;

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
        UniversityInfo(
          name: element['name'],
          imageUrl: element['imageUrl'],
          formsOfTraining: element['formsOfTraining'],
          idUniversity: element['idUniversity'],
          isNationalUniversity: element['isNationalUniversity'],
          listMajors: listMajors,
          location: element['location'],
          maxTuition: element['maxTuition'],
          universityType: element['universityType'],
          minTuition: element['minTuition'],
          universityUrl: element['universityUrl'],
        ),
      );
    });
    _listUniversity.addAll(listUniversity);
    notifyListeners();
  }
}
