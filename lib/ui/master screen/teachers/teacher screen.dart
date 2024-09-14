import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:leader_academy/data/repo/Api%20manager/Api%20manager.dart';
import 'package:leader_academy/ui/master%20screen/teachers/teacher%20wedjet.dart';
import 'package:leader_academy/ui/utiles/colors.dart';
import 'package:leader_academy/view%20model/main%20provider.dart';
import 'package:provider/provider.dart';

class TeacherScreen extends StatelessWidget {
  const TeacherScreen({super.key});
  //static const String TeacherScreenname ='teacherScreen';
  @override
  Widget build(BuildContext context) {
    TextEditingController searchtext = TextEditingController();

    List<Teachermodel> teachermodellist = [
      Teachermodel(
          imgpath: 'assets/images/test rectangle pic.png',
          txt1: '  أ / أشرف عابد  ',
          txt2: 'لغة انجليزية'),
      Teachermodel(
          imgpath: 'assets/images/test rectangle pic.png',
          txt1: '  أ / يوسف عبده  ',
          txt2: 'احياء'),
      Teachermodel(
          imgpath: 'assets/images/test rectangle pic.png',
          txt1: '  أ / مصطفى   ',
          txt2: 'لغه عربيه'),
    ];

    MainProvider provider = Provider.of(context);
print(provider.loginResponse.user!.educationalLevelId!);
print(provider.loginResponse.token!);
    return Container(
      child: Stack(
        children: [
          // Column(
          //   children: [
          //     SizedBox(height: MediaQuery.of(context).size.height*0.035,),
          //     Container(
          //         height: MediaQuery.of(context).size.height*0.2,
          //         child: Image.asset('assets/images/logopic..png',fit: BoxFit.cover,)),
          //   //Text('مدرسيناا', style: TextStyle(color: Colors.cyanAccent,fontSize: 22,fontWeight: FontWeight.w800),)
          //   ],
          // ),

          Column(
            children: [
              //SizedBox(height: MediaQuery.of(context).size.height*0.05,),
              // Row(
              //   children: [
              //     Text('صباح الخير', style: TextStyle(color: Colors.blue,fontSize: 22,fontWeight: FontWeight.w600),),
              //   ],
              // ),

              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .01,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * .2,
                    height: MediaQuery.of(context).size.height * 0.045,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: ColorApp.secondrycolor
                        // border: Border.all(
                        //   width: 3,
                        //   color: Colors.black
                        // )
                        ),
                    child: Center(
                        child: Text(
                      'بحث',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    )),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .03,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * .75,
                    height: MediaQuery.of(context).size.height * .06,
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: '                        ابحث عن المدرس',
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          //prefixIcon: Icon(Icons.search,color:ColorApp.primarycolor ),
                          suffixIcon:
                              Icon(Icons.search, color: ColorApp.primarycolor)),
                      validator: (value) {
                        if (value!.isEmpty || value.trim().isEmpty) {
                          return "this field can't be empty ";
                        }
                      },
                      controller: searchtext,
                    ),
                  ),
                ],
              ),
              // Container(
              //     height: MediaQuery.of(context).size.height*0.2,
              //     child: Image.asset('assets/images/logopic..png',fit: BoxFit.fill,)),
              FutureBuilder(
                future: Apimanager.getteachers(provider.loginResponse.token!,provider.loginResponse.user!.educationalLevelId!),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return TeacherWedget(
                            teacher: snapshot.data!.teachers![index],
                          );
                        },
                        itemCount: snapshot.data!.teachers?.length,
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Column(
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height * 0.3,),
                        Center(
                          child: Text(
                            'Some thing went wrong',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w800),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Column(
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height * 0.3,),
                        Center(
                          child: CircularProgressIndicator(),
                        ),
                      ],
                    );
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
