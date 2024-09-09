import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leader_academy/data/repo/modules/lessons%20list/LessonsResponse.dart';
import 'package:leader_academy/ui/lesson%20details/lesson%20details%20screen.dart';
import 'package:leader_academy/ui/utiles/colors.dart';
import 'package:leader_academy/view%20model/main%20provider.dart';
import 'package:provider/provider.dart';

class LessonWedget extends StatelessWidget {
   LessonWedget({super.key,required this.lessons});
  //Materiallessonmodel materialmodel ;
   Lessons lessons;
  @override
  Widget build(BuildContext context) {
    MainProvider mainProvider = Provider.of(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal:  MediaQuery.of(context).size.width*.02,vertical: MediaQuery.of(context).size.height*0.03 ),
      height: MediaQuery.of(context).size.height*0.2,
      margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05,vertical:MediaQuery.of(context).size.height*0.008 ),
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
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(lessons.title??"", style: TextStyle(color: Colors.black,fontSize: 21,fontWeight: FontWeight.w800),),
                SizedBox(height:  MediaQuery.of(context).size.height*0.05 ,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        mainProvider.lessonid = lessons.id!;
                       Navigator.pushNamed(context, LessonDetailsScreen.LessonDetailsScreenname);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: ColorApp.secondrycolor,
                        ),
                        width:MediaQuery.of(context).size.width*0.3 ,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('تصفح الان',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(width:MediaQuery.of(context).size.width*0.05 ,),
          Container(
            height: MediaQuery.of(context).size.height*0.17,
          width: MediaQuery.of(context).size.width*0.32,
          child: Image.asset('assets/images/test rectangle pic.png',fit: BoxFit.fill,),
                    )
        ],
      ),
    );
  }
}

class Materiallessonmodel{
  String imgpath='';
  String txt1='';
  String txt2 = '';
  Materiallessonmodel({required this.imgpath,required  this.txt1,required this.txt2});
}