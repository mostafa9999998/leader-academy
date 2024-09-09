class PackageSubscription {
  PackageSubscription({
      this.validPackages, 
      this.message,});

  PackageSubscription.fromJson(dynamic json) {
    if (json['valid_packages'] != null) {
      validPackages = [];
      json['valid_packages'].forEach((v) {
        validPackages?.add(ValidPackages.fromJson(v));
      });
    }
    else {
      validPackages = [];
    }
    message = json['message'];
  }
  List<ValidPackages>? validPackages;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (validPackages != null) {
      map['valid_packages'] = validPackages?.map((v) => v.toJson()).toList();
    }
    map['message'] = message;
    return map;
  }

}

class ValidPackages {
  ValidPackages({
      this.id, 
      this.subjectId, 
      this.title, 
      this.description, 
      this.teacherId, 
      this.educationalLevelId,});

  ValidPackages.fromJson(dynamic json) {
    id = json['id'];
    subjectId = json['subject_id'];
    title = json['title'];
    description = json['description'];
    teacherId = json['teacher_id'];
    educationalLevelId = json['educational_level_id'];
  }
  int? id;
  int? subjectId;
  String? title;
  String? description;
  int? teacherId;
  int? educationalLevelId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['subject_id'] = subjectId;
    map['title'] = title;
    map['description'] = description;
    map['teacher_id'] = teacherId;
    map['educational_level_id'] = educationalLevelId;
    return map;
  }

}