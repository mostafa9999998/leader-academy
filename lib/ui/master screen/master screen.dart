import 'package:flutter/material.dart';
import 'package:leader_academy/data/repo/Api%20manager/Api%20manager.dart';
import 'package:leader_academy/ui/login/login_screen.dart';
import 'package:leader_academy/ui/master%20screen/courses/courses%20screen.dart';
import 'package:leader_academy/ui/master%20screen/home/home%20screen.dart';
import 'package:leader_academy/ui/master%20screen/teachers/teacher%20screen.dart';
import 'package:leader_academy/ui/utiles/colors.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:leader_academy/view%20model/main%20provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';



class MasterScreen extends StatefulWidget {
   MasterScreen({super.key});
   static  String masterScreenname = 'MasterScreen ';
  @override
  State<MasterScreen> createState() => _MasterScreenState();
}

class _MasterScreenState extends State<MasterScreen> {
  @override
  void initState() {
    super.initState();
    secureScreen();
  }

  Future<void> secureScreen() async {
    await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  }


  @override
  Widget build(BuildContext context) {

    MainProvider provider = Provider.of(context);
    return WillPopScope(
      onWillPop: ()async {
        return false ;
      },
      child: Scaffold(
        appBar: AppBar(
          leading:InkWell(
            onTap: () async{
              final SharedPreferences x = await SharedPreferences.getInstance();
              x.remove('login5key');
              Navigator.pushNamed(context, Loginscreen.loginroutename);
              Apimanager.logout(provider.loginResponse.token!);
              },
            child: Row(
              children: [
                SizedBox(width: MediaQuery.of(context).size.width*0.04,),

                Text('Log out',style: TextStyle(color: ColorApp.primarycolor,fontSize: 16,fontWeight: FontWeight.w600),),
                Icon(Icons.logout,color:  ColorApp.primarycolor,size: 30,),
              ],
            ),
          ) ,
          leadingWidth: MediaQuery.of(context).size.width*0.4,
          elevation: 0,
          //title:  Container(
           // height: MediaQuery.of(context).size.height*.05,
           // width: MediaQuery.of(context).size.width*.3,
           // child:
          //),
           actions: [
             Text('مرحباا بك', style: TextStyle(color: ColorApp.secondrycolor,fontSize: 22,fontWeight: FontWeight.w600),),
             SizedBox(width:MediaQuery.of(context).size.width*.05 ,)
           ],
        ),
        bottomNavigationBar: ClipRRect(
          // borderRadius: BorderRadius.only(
          //   topLeft: Radius.circular(30),
          //   topRight:  Radius.circular(30)
          // ),
          child: BottomNavigationBar(
         //   enableFeedback: false,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            //currentIndex: currentindex,
            selectedItemColor: ColorApp.secondrycolor,
            unselectedItemColor: Colors.grey ,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.video_library),
                  label: 'كورسات'
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.people),
                  label: 'المدرسين'
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home_filled), //ImageIcon(AssetImage('assets/images/home.png')),
                label: 'الرئيسية'
              ),


            ],
            onTap: (index) async {
              provider.currentindex = index;
              setState(() {});
              if (index ==1){
                provider.teacherlist = await Apimanager.search( '', provider.loginResponse.user!.educationalLevelId!,provider.loginResponse.token!,);
                provider.notifyListeners();
              }

            },
            currentIndex: provider.currentindex,
          ),
        ),
        body: screens[provider.currentindex],
      ),
    );
  }
  @override
  void dispose() {
    FlutterWindowManager.clearFlags(FlutterWindowManager.FLAG_SECURE);
    super.dispose();
  }

  List screens = [CoursesScreen(),TeacherScreen(),Home()];
}
