import 'package:flutter/cupertino.dart';
import 'package:leader_academy/data/repo/modules/login/LoginResponse.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainProvider extends ChangeNotifier{
 late LoginResponse loginResponse ;
 int currentindex = 2;
 late int teacherid;
 late int packageid;
 late int lessonid;
 late String macaddress;
 SharedPreferences? prefs;
 static String login_id = 'login1key';
 static String login_name = 'login2key';
 static String login_phone = 'login3key';
 static String login_educationleve = 'login4key';
 static String login_statues = 'login5key';
 static String login_token = 'login6key';

 Future<void> setloginid(int loginrespons) async {
  await prefs!.setInt(login_id, loginrespons);
 }

 int? getloginid() {
  return prefs!.getInt(login_id);
 }

 Future<void> setloginlevel(int loginrespons) async {
  await prefs!.setInt(login_educationleve, loginrespons);
 }

 int? getloginlevel() {
  return prefs!.getInt(login_educationleve);
 }

 Future<void> setloginname(String loginrespons) async {
  await prefs!.setString(login_name, loginrespons);
 }

 String? getloginname() {
  return prefs!.getString(login_name);
 }

 Future<void> setloginphone(String loginrespons) async {
  await prefs!.setString(login_phone, loginrespons);
 }

 String? getloginphone() {
  return prefs!.getString(login_phone);
 }

 Future<void> setloginstatus(String loginrespons) async {
  await prefs!.setString(login_statues, loginrespons);
 }

 String? getloginstatuse() {
  return prefs!.getString(login_statues);
 }

 Future<void> setlogintoken(String loginrespons) async {
  await prefs!.setString(login_token, loginrespons);
 }

 String? getlogintoken() {
  return prefs!.getString(login_token);
 }

 Future<void> loading() async {
  prefs = await SharedPreferences.getInstance();

  if (getloginphone() != null) {
   String s = getloginphone()!;
   //final jsonMap = Map<String,dynamic>.from(json.decode(s));
   //var b = SharedResponse.fromJson(jsonMap);
   //var b =  SharedResponse.fromJson(jsonDecode(s));
   print(
       '$s=======================================================================');
   //print(b.toJson().toString());
   LoginResponse lo = LoginResponse(
      token: getlogintoken(),
       user: User(
           id: getloginid(),
           name: getloginname(),
           phone: getloginphone(),
        educationalLevelId: getloginlevel(),
        status: getloginstatuse()
       ));
   loginResponse = lo ;
  }
 }

}