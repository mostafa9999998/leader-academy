import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leader_academy/data/repo/Api%20manager/Api%20manager.dart';
import 'package:leader_academy/ui/materials/materials%20screen.dart';
import 'package:leader_academy/ui/utiles/colors.dart';
import 'package:leader_academy/view%20model/main%20provider.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  static const String ProfileScreenname = 'ProfileScreen';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    MainProvider provider = Provider.of(context);

    return FutureBuilder(
      future: Apimanager.getteacherprofile(provider.loginResponse.token!,provider.teacherid),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              toolbarHeight: MediaQuery.of(context).size.height * 0.05,
              leading: InkWell(
                onTap: () => Navigator.pop(context),
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.04,
                    ),
                    Icon(
                      Icons.arrow_back_ios,
                      color: ColorApp.secondrycolor,
                    ),
                    Text(
                      'Back',
                      style: TextStyle(
                          color: ColorApp.secondrycolor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
              leadingWidth: MediaQuery.of(context).size.width * 0.4,
              // actions: [
              //   Icon(Icons.notifications,color:  ColorApp.secondrycolor,),
              //   SizedBox(width: 9,),
              //   Icon(Icons.person,color:  ColorApp.secondrycolor,),
              //   SizedBox(width: MediaQuery.of(context).size.width*0.07,),
              // ],
            ),
            body: Stack(children: [
              Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * .2,
                    child: Image.asset(
                      'assets/images/logopic..png',
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .11,
                  ),
                  Center(
                    child: CircleAvatar(
                      //  child: Image.asset('assets/images/test rectangle pic.png',fit: BoxFit.cover,),
                      radius: 75,
                      backgroundImage: NetworkImage(
                        snapshot.data!.teacher!.image??'',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .005,
                  ),
                  Center(
                      child: Text(
                    snapshot.data!.teacher!.name??"",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold,color: Colors.blue),
                  )),
                  Center(
                      child: Text(
                        snapshot.data!.teacher!.subject!.name??"" ,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600,color: Color(0xff4D4D4D)),
                  )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .03,
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    height: MediaQuery.of(context).size.height * .35,
                    //width: MediaQuery.of(context).size.height * .2,
                    decoration: BoxDecoration(
                      color: Color(0x89e3e2e2),
                        borderRadius: BorderRadius.circular(25)),
                    child: SingleChildScrollView(
                      child: Text(
                        '''${snapshot.data!.teacher!.description??""}''',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),

                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .03,
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width*0.9,
                    height:MediaQuery.sizeOf(context).width*0.15 ,
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    child: ElevatedButton(onPressed: (){
                      Navigator.pushNamed(context, MaterialsScreen.MaterialsScreenname);
                    },
                      child: Text('اذهب للمحاضرات',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 26,color: Colors.white),),
                      style: ElevatedButton.styleFrom(
                          backgroundColor:Color(0xff0F0C80),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                  ),

                ],
              )
            ]),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              'Some thing went wrong',
              style: TextStyle(
                  fontSize: 22, fontWeight: FontWeight.w800),
            ),
          );
        } else {
          return  Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.3,),
              Center(
                child: CircularProgressIndicator(),
              ),
            ],
          );
        }
      },
    );

  }
}
