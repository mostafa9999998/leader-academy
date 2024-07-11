import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leader_academy/ui/materials%20lessons/lesson%20wedjet.dart';

class MaterialsLessonScreen extends StatelessWidget {
  const MaterialsLessonScreen({super.key});
  static const String MateriallessonScreenname ='MaterialsLessonScreen';
  @override
  Widget build(BuildContext context) {

   List<Materiallessonmodel> materialmodellist = [
     Materiallessonmodel(txt2:'تصفح الان' ,
     imgpath:'assets/images/test rectangle pic.png' ,
     txt1: 'الاحتكاك '),
     Materiallessonmodel(txt2:'تصفح الان' ,
         imgpath:'assets/images/test rectangle pic.png' ,
         txt1: 'العزوم'),
     Materiallessonmodel(txt2:'تصفح الان' ,
     imgpath:'assets/images/test rectangle pic.png' ,
     txt1: 'العزوم'),
     Materiallessonmodel(txt2:'تصفح الان' ,
         imgpath:'assets/images/test rectangle pic.png' ,
         txt1: 'العزوم'),
   ];

    return Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                Container(
                    height: MediaQuery.of(context).size.height*0.2,
                    child: Image.asset('assets/images/logopic..png',fit: BoxFit.fill,)),
              ],
            ),

            Column(
              children: [
                 SizedBox(height: MediaQuery.of(context).size.height*0.22,),
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
          ],
        ),
      );
  }
}
