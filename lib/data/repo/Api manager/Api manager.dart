import 'dart:convert';
import 'package:http/http.dart';
import 'package:leader_academy/data/repo/modules/lessons%20list/LessonsResponse.dart';
import 'package:leader_academy/data/repo/modules/login/LoginBody.dart';
import 'package:leader_academy/data/repo/modules/login/LoginResponse.dart';
import 'package:leader_academy/data/repo/modules/packages%20list/PackageResponse.dart';
import 'package:leader_academy/data/repo/modules/register/RegisterBody.dart';
import 'package:leader_academy/data/repo/modules/register/RegisterResponse.dart';
import 'package:leader_academy/data/repo/modules/teachers%20list/TeachersResponse.dart';

class Apimanager {
 // late final userid;
  static String apikey = "https://leader-acadmy.hwnix.com";


  static Future<LoginResponse> loginresponse(
      String phone, String password) async {
    Uri url = Uri.parse("$apikey/api/login");
    LoginBody loginBody = LoginBody(
      phone:phone ,
      password: password,
    );
    var response = await post(url, body: loginBody.toJson());

    var b = LoginResponse.fromJson(jsonDecode(response.body));
    return b;
  }

  static Future<bool> login(String phone, String password) async {

    Uri url = Uri.parse("$apikey/api/login");
    LoginBody loginBody = LoginBody(
      phone:phone ,
      password: password,
    );
    var response = await post(url, body: loginBody.toJson());
    if (response.statusCode >= 200 || response.statusCode < 300) {
      var b = LoginResponse.fromJson(jsonDecode(response.body));
      print(b.user?.status);
      print(b.user?.phone);
      if (b.user?.status == 'pending') {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }

  }

  static Future<bool> register(
      String name, String educationalLevel, String phone, String password) async {
    Uri url = Uri.parse("$apikey/api/signup");

    RegisterBody registerBody = RegisterBody(
        name: name, password: password, phone: phone,educationalLevel: educationalLevel);
    var response = await post(url, body: registerBody.toJson());
    if (response.statusCode >= 200 || response.statusCode < 300) {
      var b = RegisterResponse.fromJson(jsonDecode(response.body));
      if (b.user?.phone != null) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }


  static Future<TeachersResponse> getteachers(String token) async {
    try {
      Uri url = Uri.parse("$apikey/api/teacher/educational-level/1");
      Response response = await get(url,headers: {'Authorization': 'Bearer $token',});
      print(response.body[0]);
      Map json = jsonDecode(response.body);
      TeachersResponse teachersResponse = TeachersResponse.fromJson(json);
        return teachersResponse;

    } catch (e) {
      throw e;
    }
  }

  static Future<PackageResponse> getpackages(String token) async {
    try {
      Uri url = Uri.parse("$apikey/api/getPackages/1/3");
      Response response = await get(url,headers: {'Authorization': 'Bearer $token',});
      print(response.body[0]);
      Map json = jsonDecode(response.body);
      PackageResponse packageResponse = PackageResponse.fromJson(json);
        return packageResponse;

    } catch (e) {
      throw e;
    }
  }

  static Future<LessonsResponse> getlessons() async {
    try {
      Uri url = Uri.parse("$apikey/api/getlessons/2");
      Response response = await get(url);
      print(response.body[0]);
      Map json = jsonDecode(response.body);
      LessonsResponse lessonsResponse = LessonsResponse.fromJson(json);
        return lessonsResponse;

    } catch (e) {
      throw e;
    }
  }

 }