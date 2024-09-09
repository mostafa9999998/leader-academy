import 'package:flutter/material.dart';
import 'package:leader_academy/data/repo/Api%20manager/Api%20manager.dart';
import 'package:leader_academy/ui/materials%20lessons/lesson%20wedjet.dart';

class LessonContainer extends StatelessWidget {
  const LessonContainer({super.key});

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

    return Container(
      child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height*0.0,),
              // Container(
              //     height: MediaQuery.of(context).size.height*0.2,
              //     child: Image.asset('assets/images/logopic..png',fit: BoxFit.fill,)),
              // FutureBuilder(
              //   future: Apimanager.getlessons(),
              //   builder: (context, snapshot) {
              //     if (snapshot.hasData) {
              //       return Expanded(
              //         child: ListView.builder(
              //           itemBuilder: (context, index) {
              //             return LessonWedget(
              //               lessons: snapshot.data!.lessons![index],
              //             );
              //           },
              //           itemCount: snapshot.data!.lessons!.length,
              //         ),
              //       );
              //     } else if (snapshot.hasError) {
              //       return Center(
              //         child: Text(
              //           'Some thing went wrong',
              //           style: TextStyle(
              //               fontSize: 22, fontWeight: FontWeight.w800),
              //         ),
              //       );
              //     } else {
              //       return Center(
              //         child: CircularProgressIndicator(),
              //       );
              //     }
              //   },
              // ),


              // Expanded(
              //   child: ListView.builder(itemBuilder: (context, index) {
              //     return LessonWedget(materialmodel: materialmodellist[index]);
              //   },
              //     itemCount: materialmodellist.length,
              //   ),
              // ),
            ],
          ),

    );
  }
}
