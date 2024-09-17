class SearchResponse {
  SearchResponse({
      this.teacherId, 
      this.name, 
      this.image, 
      this.fullSrc, 
      this.subject,});

  SearchResponse.fromJson(dynamic json) {
    teacherId = json['teacher_id'];
    name = json['name'];
    image = json['image'];
    fullSrc = json['FullSrc'];
    subject = json['subject'] != null ? Subject.fromJson(json['subject']) : null;
  }
  int? teacherId;
  String? name;
  dynamic image;
  String? fullSrc;
  Subject? subject;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['teacher_id'] = teacherId;
    map['name'] = name;
    map['image'] = image;
    map['FullSrc'] = fullSrc;
    if (subject != null) {
      map['subject'] = subject?.toJson();
    }
    return map;
  }

}

class Subject {
  Subject({
      this.subjectName,});

  Subject.fromJson(dynamic json) {
    subjectName = json['subject_name'];
  }
  String? subjectName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['subject_name'] = subjectName;
    return map;
  }

}