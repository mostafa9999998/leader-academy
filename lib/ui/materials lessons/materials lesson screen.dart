import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leader_academy/ui/materials%20lessons/lesson%20container.dart';
import 'package:leader_academy/ui/materials%20lessons/lesson%20wedjet.dart';
import 'package:leader_academy/ui/utiles/colors.dart';

class MaterialsLessonScreen extends StatelessWidget {
  const MaterialsLessonScreen({super.key});
  static const String MateriallessonScreenname ='MaterialsLessonScreen';
  @override
  Widget build(BuildContext context) {
    List<Materiallessonmodel> materialmodellist = [
      Materiallessonmodel(txt2:'تصفح الان' ,
          imgpath:'assets/images/test rectangle pic.png' ,
          txt1: 'المحاضره الاولى '),
      Materiallessonmodel(txt2:'تصفح الان' ,
          imgpath:'assets/images/test rectangle pic.png' ,
          txt1: 'المحاضره الثانية'),
      Materiallessonmodel(txt2:'تصفح الان' ,
          imgpath:'assets/images/test rectangle pic.png' ,
          txt1: 'المحاضره الثالثه'),
      Materiallessonmodel(txt2:'تصفح الان' ,
          imgpath:'assets/images/test rectangle pic.png' ,
          txt1: 'المحاضره الرابعة'),
    ];


    return Scaffold(
     appBar: AppBar(
        leading:InkWell(
          onTap: () => Navigator.pop(context),
          child: Row(
            children: [
              SizedBox(width: MediaQuery.of(context).size.width*0.04,),
              Icon(Icons.arrow_back_ios,color:  ColorApp.secondrycolor,),
              Text('Back',style: TextStyle(color: ColorApp.secondrycolor,fontSize: 16,fontWeight: FontWeight.w600),)
            ],
          ),
        ) ,
        leadingWidth: MediaQuery.of(context).size.width*0.4,
        // actions: [
        //   Icon(Icons.notifications,color:  ColorApp.secondrycolor,),
        //   SizedBox(width: 9,),
        //   Icon(Icons.person,color:  ColorApp.secondrycolor,),
        //   SizedBox(width: MediaQuery.of(context).size.width*0.07,),
        // ],
      ),
        body:Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height*0.0,),
            // Container(
            //     height: MediaQuery.of(context).size.height*0.2,
            //     child: Image.asset('assets/images/logopic..png',fit: BoxFit.fill,)),
            Expanded(
              child: ListView.builder(itemBuilder: (context, index) {
                return LessonWedget(materialmodel: materialmodellist[index]);
              },
                itemCount: materialmodellist.length,
              ),
            ),
          ],
        ),
      );
  }
}
