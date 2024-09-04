class LessonsResponse {
  LessonsResponse({
      this.lessons,});

  LessonsResponse.fromJson(dynamic json) {
    if (json['lessons'] != null) {
      lessons = [];
      json['lessons'].forEach((v) {
        lessons?.add(Lessons.fromJson(v));
      });
    }
  }
  List<Lessons>? lessons;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (lessons != null) {
      map['lessons'] = lessons?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Lessons {
  Lessons({
      this.id, 
      this.title, 
      this.description, 
      this.descriptionAssistant, 
      this.packageId, 
      this.teacherId,});

  Lessons.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    descriptionAssistant = json['description_assistant'];
    packageId = json['package_id'];
    teacherId = json['teacher_id'];
  }
  int? id;
  String? title;
  String? description;
  String? descriptionAssistant;
  int? packageId;
  int? teacherId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['description'] = description;
    map['description_assistant'] = descriptionAssistant;
    map['package_id'] = packageId;
    map['teacher_id'] = teacherId;
    return map;
  }

}