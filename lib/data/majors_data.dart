const data = [
  'Công nghệ thông tin',
  'Khoa học máy tính',
  'Công nghệ phần mềm',
];

// final university = UniversityInfo(
//   name: _tenTruong,
//   imageUrl: _linkAnh,
//   formsOfTraining: _hinhThucDaoTao,
//   idUniversity: _maTruong,
//   isNationalUniversity: isNationalUniversity,
//   listMajors: listMajors,
//   location: _diaChi,
//   maxTuition: _maxTuition,
//   minTuition: _minTuition,
//   universityType: _loaiTruong,
//   universityUrl: _linkWeb,
// );
class Majors {
  final String idMajors;
  final String name;
  final String studyTime;
  final List grade;
  Majors({
    required this.grade,
    required this.idMajors,
    required this.name,
    required this.studyTime,
  });
}

class IndustryGroups {
  String? name;
  List<Majors> _industryGroup;
  List<Majors> get industryGroup => _industryGroup;
  IndustryGroups(this._industryGroup);
  void addIndustryGroup(Majors majors) {
    _industryGroup.add(majors);
  }
}

class ListMajors {
  List<IndustryGroups> _listMajors;
  List<IndustryGroups> get listMajors => _listMajors;
  ListMajors(this._listMajors);
}
