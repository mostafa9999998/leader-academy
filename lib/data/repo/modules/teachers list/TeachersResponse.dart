class TeachersResponse {
  TeachersResponse({
      this.teachers,
    this.message,});

  TeachersResponse.fromJson(dynamic json) {
    if (json['teachers'] != null) {
      teachers = [];
      json['teachers'].forEach((v) {
        teachers?.add(Teachers.fromJson(v));
      });
    }
    else{
      teachers = [];
    }
      message = json['message'];
  }
  List<Teachers>? teachers;
    String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (teachers != null) {
      map['teachers'] = teachers?.map((v) => v.toJson()).toList();
    }
    map['message'] = message;
    return map;
  }

}

class Teachers {
  Teachers({
      this.id, 
      this.name, 
      this.educationalLevel, 
      this.subject, 
      this.fullSrc,});

  Teachers.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    educationalLevel = json['educational_level'];
    subject = json['subject'];
    fullSrc = json['FullSrc'];
  }
  int? id;
  String? name;
  String? educationalLevel;
  String? subject;
  String? fullSrc;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['educational_level'] = educationalLevel;
    map['subject'] = subject;
    map['FullSrc'] = fullSrc;
    return map;
  }

}