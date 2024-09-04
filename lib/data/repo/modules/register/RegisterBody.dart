class RegisterBody {
  RegisterBody({
      this.name, 
      this.phone, 
      this.password, 
      this.educationalLevel,});

  RegisterBody.fromJson(dynamic json) {
    name = json['name'];
    phone = json['phone'];
    password = json['password'];
    educationalLevel = json['educational_level'];
  }
  String? name;
  String? phone;
  String? password;
  String? educationalLevel;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['phone'] = phone;
    map['password'] = password;
    map['educational_level'] = educationalLevel;
    return map;
  }

}