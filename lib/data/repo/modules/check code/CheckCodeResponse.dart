class CheckCodeResponse {
  CheckCodeResponse({
      this.message, 
      this.code,});

  CheckCodeResponse.fromJson(dynamic json) {
    message = json['message'];
    code = json['code'] != null ? Code.fromJson(json['code']) : null;
  }
  String? message;
  Code? code;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (code != null) {
      map['code'] = code?.toJson();
    }
    return map;
  }

}

class Code {
  Code({
      this.id, 
      this.userId, 
      this.code, 
      this.expiresAt, 
      this.macAddress, 
      this.macAddress2, 
      this.lessonId, 
      this.type, 
      this.type2,});

  Code.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    code = json['code'];
    expiresAt = json['expires_at'];
    macAddress = json['mac_address'];
    macAddress2 = json['mac_address2'];
    lessonId = json['lesson_id'];
    type = json['type'];
    type2 = json['type2'];
  }
  int? id;
  int? userId;
  String? code;
  String? expiresAt;
  String? macAddress;
  String? macAddress2;
  int? lessonId;
  String? type;
  String? type2;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['code'] = code;
    map['expires_at'] = expiresAt;
    map['mac_address'] = macAddress;
    map['mac_address2'] = macAddress2;
    map['lesson_id'] = lessonId;
    map['type'] = type;
    map['type2'] = type2;
    return map;
  }

}