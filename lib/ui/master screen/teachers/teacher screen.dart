import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:leader_academy/data/repo/modules/teachers%20list/TeachersResponse.dart';
import 'package:leader_academy/data/repo/Api%20manager/Api%20manager.dart';
import 'package:leader_academy/ui/master%20screen/teachers/teacher%20wedjet.dart';
import 'package:leader_academy/ui/utiles/colors.dart';
import 'package:leader_academy/view%20model/main%20provider.dart';
import 'package:provider/provider.dart';

class TeacherScreen extends StatefulWidget {
  const TeacherScreen({super.key});

  @override
  State<TeacherScreen> createState() => _TeacherScreenState();
}

class _TeacherScreenState extends State<TeacherScreen> {
  //static const String TeacherScreenname ='teacherScreen';
  @override
  Widget build(BuildContext context) {
    TextEditingController searchtext = TextEditingController();
    MainProvider provider = Provider.of(context);
    List<Teachers> teacherr = [];
   // late TeachersResponse x ;

    return Container(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.width * .01,
          ),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * .01,
              ),
              InkWell(
                onTap: () async{
                  provider.teacherlist = await Apimanager.search( searchtext.text, provider.loginResponse.user!.educationalLevelId!,provider.loginResponse.token!,);
                  provider.notifyListeners();
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * .2,
                  height: MediaQuery.of(context).size.height * 0.045,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: ColorApp.secondrycolor
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

                  controller: searchtext,
                ),
              ),
            ],
          ),
           Expanded(
                   child: ListView.builder(
                      itemBuilder: (context, index) {
                               return TeacherWedget(
                                teacher:provider.teacherlist[index],
                              );
                           },
                           itemCount: provider.teacherlist.length,
                     ),
                   ),
        ],
      ),
    );
  }


}

