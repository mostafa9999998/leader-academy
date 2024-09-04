class LoginResponse {
  LoginResponse({
      this.user, 
      this.token,});

  LoginResponse.fromJson(dynamic json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }
  User? user;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }

}

class User {
  User({
      this.id, 
      this.name, 
      this.phone, 
      this.educationalLevelId, 
      this.status,});

  User.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    educationalLevelId = json['educational_level_id'];
    status = json['status'];
  }
  int? id;
  String? name;
  String? phone;
  int? educationalLevelId;
  String? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['phone'] = phone;
    map['educational_level_id'] = educationalLevelId;
    map['status'] = status;
    return map;
  }

}