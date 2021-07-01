import 'info.dart';

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

class Majors extends Info {
  final String codeHtml;
  final String linkRoot;
  final bool isHot;

  Majors({
    required name,
    required imageUrl,
    required description,
    required this.linkRoot,
    required this.codeHtml,
    required this.isHot,
  }) : super(
          name: name,
          imageUrl: imageUrl,
          description: description,
        );

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
