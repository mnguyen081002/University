class MajorsF {
  final String idMajors;
  final String name;
  final String studyTime;
  final List grade;
  MajorsF({
    required this.grade,
    required this.idMajors,
    required this.name,
    required this.studyTime,
  });
  factory MajorsF.fromJson(dynamic jsonData) {
    return MajorsF(
      grade: jsonData['grade'],
      idMajors: jsonData['idMajors'],
      name: jsonData['nameMajors'],
      studyTime: jsonData['studyTime'],
    );
  }
  static fromMap(Map<String, dynamic> mapData) {
    return MajorsF(
      grade: mapData['grade'],
      idMajors: mapData['idMajors'],
      name: mapData['nameMajors'],
      studyTime: mapData['studyTime'],
    );
  }
}

class Majors {
  final String codeHtml;
  final String imageUrl;
  final String description;
  final String linkRoot;
  final String name;
  final bool isHot;

  Majors({
    required this.codeHtml,
    required this.imageUrl,
    required this.isHot,gi
    required this.name,
    required this.linkRoot,
    required this.description,
  });

  factory Majors.fromJson(dynamic json) {
    return Majors(
      codeHtml: json['codeHtml'],
      imageUrl: json['imageUrl'],
      isHot: json['isHot'],
      name: json['majorName'],
      linkRoot: json['linkRoot'],
      description: json['description'],
    );
  }
  static fromFirebase(List data) {
    return data.map((major) => Majors.fromJson(major)).toList();
  }
}
