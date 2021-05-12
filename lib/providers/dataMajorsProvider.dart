import 'package:flutter/foundation.dart';
import 'package:university_helper/data/majors_data.dart';

class DataMajorsProvider extends ChangeNotifier {
  List<Majors> _listMajors = [];
  List<Majors> get listMajors => _listMajors;
  void addMajors({
    required List<String> grade,
    required String idMajors,
    required String name,
    required String studyTime,
  }) {
    _listMajors.add(Majors(
        grade: grade, idMajors: idMajors, name: name, studyTime: studyTime));
    notifyListeners();
  }

  void clear() {
    _listMajors.clear();
    notifyListeners();
  }

  void removeMajors(Majors majors) {
    _listMajors.remove(majors);
    notifyListeners();
  }
}
