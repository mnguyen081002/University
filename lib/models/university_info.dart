import 'package:university_helper/data/majors_data.dart';

enum UniversityType {
  DaiHoc,
  CaoDang,
  Nghe,
}
enum UniversityForm {
  CongLap,
  TuThuc,
}
enum FormOfTraining {
  ChinhQuy,
  ThuongXuyen,
  LienThong,
}
enum Area {
  MienTrung,
  MienBac,
  MienNam,
  MienTay,
}

class UniversityInfo {
  final String imageUrl;
  final List<Majors> listMajors;
  final String formsOfTraining;
  final String name;
  final String idUniversity;
  final double minTuition;
  final double maxTuition;
  final String location;
  final String universityType;
  final String universityUrl;
  bool isNationalUniversity;
  double rate;
  UniversityInfo({
    required this.name,
    required this.imageUrl,
    this.rate = 10,
    required this.formsOfTraining,
    required this.idUniversity,
    required this.isNationalUniversity,
    required this.listMajors,
    required this.location,
    required this.maxTuition,
    required this.minTuition,
    required this.universityType,
    required this.universityUrl,
  });
}
