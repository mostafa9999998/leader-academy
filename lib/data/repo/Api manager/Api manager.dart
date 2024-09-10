import 'dart:convert';
import 'package:http/http.dart';
import 'package:leader_academy/data/repo/modules/check%20code/CheckCodeResponse.dart';
import 'package:leader_academy/data/repo/modules/lessons%20list/LessonsResponse.dart';
import 'package:leader_academy/data/repo/modules/login/LoginBody.dart';
import 'package:leader_academy/data/repo/modules/login/LoginResponse.dart';
import 'package:leader_academy/data/repo/modules/packages%20list/PackageResponse.dart';
import 'package:leader_academy/data/repo/modules/packages%20subsciption/PackageSubscription.dart';
import 'package:leader_academy/data/repo/modules/pdf/PdfResponse.dart';
import 'package:leader_academy/data/repo/modules/register/RegisterBody.dart';
import 'package:leader_academy/data/repo/modules/register/RegisterResponse.dart';
import 'package:leader_academy/data/repo/modules/teacher%20profile/TeacherProfile.dart';
import 'package:leader_academy/data/repo/modules/teachers%20list/TeachersResponse.dart';
import 'package:leader_academy/data/repo/modules/validate%20code/ValidateCodeBody.dart';
import 'package:leader_academy/data/repo/modules/validate%20code/ValidateCodeResponse.dart';
import 'package:leader_academy/data/repo/modules/video/VideoResponse.dart';
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';

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


  static Future<ValidateCodeResponse> validatecode(
      String userId, String code,String lessonId, String macAddress2) async {
    Uri url = Uri.parse("$apikey/api/codes/validate/mobile");
    ValidateCodeBody validateCodeBody = ValidateCodeBody(
      userId: userId,
      code: code,
      lessonId: lessonId,
      macAddress2: macAddress2
    );
    var response = await post(url, body: validateCodeBody.toJson());

    var b = ValidateCodeResponse.fromJson(jsonDecode(response.body));
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


  static Future<TeachersResponse> getteachers(String token, int edulevel) async {
    try {
      Uri url = Uri.parse("$apikey/api/teacher/educational-level/$edulevel");
      Response response = await get(url,headers: {'Authorization': 'Bearer $token',});
      Map json = jsonDecode(response.body);
      TeachersResponse teachersResponse = TeachersResponse.fromJson(json);
      return teachersResponse;
    } catch (e) {
      throw e;
    }
  }

  static Future<PdfResponse> getpdfs(String token, int lessonid) async {
    try {
      Uri url = Uri.parse("$apikey/api/pdfs/lesson/$lessonid");
      Response response = await get(url,headers: {'Authorization': 'Bearer $token',});
      Map json = jsonDecode(response.body);
      PdfResponse pdfResponse = PdfResponse.fromJson(json);
      return pdfResponse;
    } catch (e) {
      throw e;
    }
  }



  static Future<PackageResponse> getpackages(String token,int teacherid,int edulevel) async {
    try {
      Uri url = Uri.parse("$apikey/api/getPackages/$teacherid/$edulevel");
      Response response = await get(url,headers: {'Authorization': 'Bearer $token',});
      print(response.body[0]);
      Map json = jsonDecode(response.body);
      PackageResponse packageResponse = PackageResponse.fromJson(json);
        return packageResponse;

    } catch (e) {
      throw e;
    }
  }

  static Future<LessonsResponse> getlessons(int packageid) async {
    try {
      Uri url = Uri.parse("$apikey/api/getlessons/$packageid");
      Response response = await get(url);
      print(response.body[0]);
      Map json = jsonDecode(response.body);
      LessonsResponse lessonsResponse = LessonsResponse.fromJson(json);
        return lessonsResponse;

    } catch (e) {
      throw e;
    }
  }


  static Future<List<VideoResponse>> getvideo(String token,int lessonid) async {
    try {
      Uri url = Uri.parse("$apikey/api/videos/lesson/$lessonid");
      Response response = await get(url,headers: {'Authorization': 'Bearer $token',});
      List<dynamic> jsonResponse = jsonDecode(response.body);
      List<VideoResponse> videoResponse =
      jsonResponse.map((json) => VideoResponse.fromJson(json)).toList();
      return videoResponse;
      // VideoResponse videoResponse = VideoResponse.fromJson(json);
      // return videoResponse;

    } catch (e) {
      throw e;
    }
  }

  static Future<TeacherProfile> getteacherprofile(String token,int teacherid) async {
    try {
      Uri url = Uri.parse("$apikey/api/getteacher/$teacherid");
      Response response = await get(url,headers: {'Authorization': 'Bearer $token',});
      Map json = jsonDecode(response.body);
      TeacherProfile teacherProfile = TeacherProfile.fromJson(json);
      return teacherProfile;

    } catch (e) {
      throw e;
    }
  }

  static Future<PackageSubscription> getpackagessubscription(String token,int userid) async {
    try {
      Uri url = Uri.parse("$apikey/api/get/packages/$userid");
      Response response = await get(url,headers: {'Authorization': 'Bearer $token',});
      Map json = jsonDecode(response.body);
      PackageSubscription packagesSubscription = PackageSubscription.fromJson(json);
      return packagesSubscription;
      // if (packagesSubscription.message == 'No valid lessons found for this user.'){
      //   packagesSubscription.validPackages = [];
      //   return packagesSubscription;
      // } else{
      //   print(packagesSubscription.validPackages?.length);
      //   return packagesSubscription;
      // }


    } catch (e) {
      throw e;
    }
  }

  static Future<String?> getMacAddress() async {
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      final AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return androidInfo.id;
    } else if (Platform.isIOS) {
      final IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      return iosInfo.identifierForVendor; // Unique device identifier on iOS
    } else {
      return null; // MAC address not available for other platforms
    }
  }

  static Future<CheckCodeResponse> checkcode(String token, int userid,int packageid, String macaddress) async {
    try {
      Uri url = Uri.parse("$apikey/api/code/check/mobile/$userid/$macaddress/$packageid");
      Response response = await get(url,headers: {'Authorization': 'Bearer $token',});
      Map json = jsonDecode(response.body);
      CheckCodeResponse checkCodeResponse = CheckCodeResponse.fromJson(json);
      return checkCodeResponse;
    } catch (e) {
      throw e;
    }
  }

 }