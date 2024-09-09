import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:leader_academy/data/repo/modules/teachers%20list/TeachersResponse.dart';
import 'package:leader_academy/ui/materials/materials%20screen.dart';
import 'package:leader_academy/ui/teacher%20profile/profile%20Screen.dart';
import 'package:leader_academy/view%20model/main%20provider.dart';
import 'package:provider/provider.dart';

class TeacherWedget extends StatelessWidget {
   TeacherWedget({super.key,required this.teacher});
   //Teachermodel teachermodel ;
   Teachers teacher ;
  @override
  Widget build(BuildContext context) {
    MainProvider mainProvider =Provider.of(context);
    return InkWell(
      onTap: () {
        mainProvider.teacherid = teacher.id!;
        Navigator.pushNamed(context, MaterialsScreen.MaterialsScreenname);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical:  MediaQuery.of(context).size.height*.005,),
        height:  MediaQuery.of(context).size.height*0.3,
        margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.15,
            vertical:MediaQuery.of(context).size.height*0.01 ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
         boxShadow: [
           BoxShadow(
               color: Colors.grey.withOpacity(.5),
               spreadRadius: 1,
               blurRadius: 7,
               offset: Offset(3.0,5.0)
           )
         ],
           color: Colors.white
         // color: Colors.deepOrange,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            //SizedBox(width:MediaQuery.of(context).size.width*0.05 ,),
            Container(
              height:MediaQuery.of(context).size.width*.35 ,
              //width: MediaQuery.of(context).size.width*.4 ,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30)
                ),
                //color: Colors.orange,
                //borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15)),
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(teacher?.fullSrc??''),
                ),
              ),
            ),
            SizedBox(height:  MediaQuery.of(context).size.height*0.01 ,),
            Center(child: Text(teacher.name??'', style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.bold,),)),
            SizedBox(height: MediaQuery.of(context).size.height*.01,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(teacher.subject??'', style: TextStyle(color: Color(0xff5D5D5D),fontSize: 18,fontWeight: FontWeight.w600),),
                SizedBox(width: MediaQuery.of(context).size.width*.015,),
                // CircleAvatar(
                //   child: Image(image:AssetImage(teachermodel.imgpath) ,fit: BoxFit.cover,),
                // ),
                InkWell(
                  onTap: () {
                    mainProvider.teacherid = teacher.id!;
                    Navigator.pushNamed(context, ProfileScreen.ProfileScreenname);
                  },
                  child: Container(
                    height:MediaQuery.of(context).size.width*.1 ,
                    width: MediaQuery.of(context).size.width*.1 ,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1000),
                      //color: Colors.orange,
                      //borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15)),
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(teacher.fullSrc??'')
                      ),
                    ),
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width*.025,)
              ],
            ),
            Spacer()
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   children: [
            //     InkWell(
            //       onTap:  () => Navigator.pushNamed(context, LessonDetailsScreen.LessonDetailsScreenname),
            //       child: Container(
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(15),
            //           color: ColorApp.secondrycolor,
            //         ),
            //         width:MediaQuery.of(context).size.width*0.3 ,
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: [
            //
            //           ],
            //         ),
            //       ),
            //     ),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}

class Teachermodel{
  String imgpath='';
  String txt1='';
  String txt2='';
  Teachermodel({required this.imgpath,required  this.txt1,required this.txt2});
}