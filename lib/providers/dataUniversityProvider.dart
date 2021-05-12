import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:university_helper/data/majors_data.dart';
import 'package:university_helper/models/university_info.dart';

class DataUniversityProvider extends ChangeNotifier {
  List<UniversityInfo> _listUniversity = [];
  List<UniversityInfo> get listUniversity => _listUniversity;

  Future<void> fetchAndSetData() async {
    final dataRef =
        await FirebaseFirestore.instance.collection('ListUniversity').get();
    final listData = dataRef.docs;
    List<UniversityInfo> listDataUniversity = [];

    listData.forEach((element) {
      final listDataMajors = element['listMajors'];
      final listMajors = [];
      listDataMajors.forEach((majors) {
        listMajors.add(
          Majors(
            grade: majors['grade'] as List,
            idMajors: majors['idMajors'] as String,
            name: majors['nameMajors'] as String,
            studyTime: majors['studyTime'] as String,
          ),
        );
      });
      listDataUniversity.add(
        UniversityInfo(
          name: element['name'],
          imageUrl: element['imageUrl'],
          formsOfTraining: element['formsOfTraining'],
          idUniversity: element['idUniversity'],
          isNationalUniversity: element['isNationalUniversity'],
          listMajors: [],
          location: element['location'],
          maxTuition: element['maxTuition'],
          universityType: element['universityType'],
          minTuition: element['minTuition'],
          universityUrl: element['universityUrl'],
        ),
      );
      _listUniversity = listDataUniversity;
    });
    notifyListeners();
  }
}
