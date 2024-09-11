class ValidateCodeResponse {
  ValidateCodeResponse({
      this.message, 
      this.errors,});

  ValidateCodeResponse.fromJson(dynamic json) {
    message = json['message'];
    errors = json['errors'] != null ? Errors.fromJson(json['errors']) : null;
  }
  String? message;
  Errors? errors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (errors != null) {
      map['errors'] = errors?.toJson();
    }
    return map;
  }

}

class Errors {
  Errors({
      this.code, 
      this.userId, 
      this.lessonId,});

  Errors.fromJson(dynamic json) {
    code = json['code'] != null ? json['code'].cast<String>() : [];
    userId = json['user_id'] != null ? json['user_id'].cast<String>() : [];
    lessonId = json['lesson_id'] != null ? json['lesson_id'].cast<String>() : [];
  }
  List<String>? code;
  List<String>? userId;
  List<String>? lessonId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['user_id'] = userId;
    map['lesson_id'] = lessonId;
    return map;
  }

}