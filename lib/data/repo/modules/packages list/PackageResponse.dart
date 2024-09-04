class PackageResponse {
  PackageResponse({
      this.packages,});

  PackageResponse.fromJson(dynamic json) {
    if (json['packages'] != null) {
      packages = [];
      json['packages'].forEach((v) {
        packages?.add(Packages.fromJson(v));
      });
    }
  }
  List<Packages>? packages;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (packages != null) {
      map['packages'] = packages?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Packages {
  Packages({
      this.id, 
      this.subjectId, 
      this.title, 
      this.description, 
      this.teacherId, 
      this.educationalLevelId, 
      this.educationalLevel,});

  Packages.fromJson(dynamic json) {
    id = json['id'];
    subjectId = json['subject_id'];
    title = json['title'];
    description = json['description'];
    teacherId = json['teacher_id'];
    educationalLevelId = json['educational_level_id'];
    educationalLevel = json['educational_level'] != null ? EducationalLevel.fromJson(json['educational_level']) : null;
  }
  int? id;
  int? subjectId;
  String? title;
  String? description;
  int? teacherId;
  int? educationalLevelId;
  EducationalLevel? educationalLevel;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['subject_id'] = subjectId;
    map['title'] = title;
    map['description'] = description;
    map['teacher_id'] = teacherId;
    map['educational_level_id'] = educationalLevelId;
    if (educationalLevel != null) {
      map['educational_level'] = educationalLevel?.toJson();
    }
    return map;
  }

}

class EducationalLevel {
  EducationalLevel({
      this.id, 
      this.name,});

  EducationalLevel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
  int? id;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

}