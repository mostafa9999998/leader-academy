class RegisterResponse {
  RegisterResponse({
      this.user,});

  RegisterResponse.fromJson(dynamic json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  User? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }

}

class User {
  User({
      this.name, 
      this.phone, 
      this.educationalLevelId, 
      this.id,});

  User.fromJson(dynamic json) {
    name = json['name'];
    phone = json['phone'];
    educationalLevelId = json['educational_level_id'];
    id = json['id'];
  }
  String? name;
  String? phone;
  int? educationalLevelId;
  int? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['phone'] = phone;
    map['educational_level_id'] = educationalLevelId;
    map['id'] = id;
    return map;
  }

}