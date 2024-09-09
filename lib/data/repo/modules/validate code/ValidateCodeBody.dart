class ValidateCodeBody {
  ValidateCodeBody({
      this.code, 
      this.macAddress2, 
      this.userId, 
      this.lessonId,});

  ValidateCodeBody.fromJson(dynamic json) {
    code = json['code'];
    macAddress2 = json['mac_address2'];
    userId = json['user_id'];
    lessonId = json['lesson_id'];
  }
  String? code;
  String? macAddress2;
  String? userId;
  String? lessonId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['mac_address2'] = macAddress2;
    map['user_id'] = userId;
    map['lesson_id'] = lessonId;
    return map;
  }

}