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
  factory Majors.fromJson(dynamic jsonData) {
    return Majors(
      grade: jsonData['grade'],
      idMajors: jsonData['idMajors'],
      name: jsonData['nameMajors'],
      studyTime: jsonData['studyTime'],
    );
  }
  static fromMap(Map<String, dynamic> mapData) {
    return Majors(
      grade: mapData['grade'],
      idMajors: mapData['idMajors'],
      name: mapData['nameMajors'],
      studyTime: mapData['studyTime'],
    );
  }

  static fromFirebase(dynamic data) {
    return List<MajorsF>.from(
      data.map(
        (i) => MajorsF(name: i['majors']),
      ),
    );
  }
}

class MajorsF {
  final String name;
  MajorsF({required this.name});
}
