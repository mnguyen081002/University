import 'package:university_helper/models/majors.dart';

class University {
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
  final String id;

  bool isNationalUniversity;
  double rate;

  University({
    required this.id,
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

  factory University.fromJson(dynamic jsonData) {
    return University(
      name: jsonData['name'],
      imageUrl: jsonData['imageUrl'],
      formsOfTraining: jsonData['formsOfTraining'],
      idUniversity: jsonData['idUniversity'],
      isNationalUniversity: jsonData['isNationalUniversity'],
      listMajors: List<Majors>.from(
          jsonData['listMajors'].map((i) => Majors.fromJson(i))),
      location: jsonData['location'],
      maxTuition: jsonData['maxTuition'].toDouble(),
      minTuition: jsonData['minTuition'].toDouble(),
      universityType: jsonData['universityType'],
      universityUrl: jsonData['universityUrl'],
      id: jsonData.id,
    );
  }

  static fromDatabase(List<dynamic> listData) {
    return List<University>.from(
        listData.map((jsonData) => University.fromJson(jsonData)));
  }
}
