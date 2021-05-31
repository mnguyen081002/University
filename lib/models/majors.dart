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
  static fromJson(dynamic jsonData) {
    return Majors(
      grade: jsonData['grade'] as List,
      idMajors: jsonData['idMajors'] as String,
      name: jsonData['nameMajors'] as String,
      studyTime: jsonData['studyTime'] as String,
    );
  }
}
