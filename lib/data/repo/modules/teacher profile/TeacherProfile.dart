class TeacherProfile {
  TeacherProfile({
      this.teacher,});

  TeacherProfile.fromJson(dynamic json) {
    teacher = json['teacher'] != null ? Teacher.fromJson(json['teacher']) : null;
  }
  Teacher? teacher;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (teacher != null) {
      map['teacher'] = teacher?.toJson();
    }
    return map;
  }

}

class Teacher {
  Teacher({
      this.id, 
      this.name, 
      this.educationalLevel, 
      this.subject, 
      this.description, 
      this.image,});

  Teacher.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    educationalLevel = json['educational_level'] != null ? EducationalLevel.fromJson(json['educational_level']) : null;
    subject = json['subject'] != null ? Subject.fromJson(json['subject']) : null;
    description = json['description'];
    image = json['image'];
  }
  int? id;
  String? name;
  EducationalLevel? educationalLevel;
  Subject? subject;
  String? description;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    if (educationalLevel != null) {
      map['educational_level'] = educationalLevel?.toJson();
    }
    if (subject != null) {
      map['subject'] = subject?.toJson();
    }
    map['description'] = description;
    map['image'] = image;
    return map;
  }

}

class Subject {
  Subject({
      this.id, 
      this.name, 
      this.educationalLevelId, 
      this.type,});

  Subject.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    educationalLevelId = json['educational_level_id'];
    type = json['type'];
  }
  int? id;
  String? name;
  int? educationalLevelId;
  dynamic type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['educational_level_id'] = educationalLevelId;
    map['type'] = type;
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