import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leader_academy/ui/lesson%20details/lesson%20details%20wedjet.dart';
import 'package:leader_academy/ui/lesson%20details/mcq/mcq%20screen.dart';
import 'package:leader_academy/ui/lesson%20details/pdfs/pdfs%20screen.dart';
import 'package:leader_academy/ui/lesson%20details/videos/videos%20screen.dart';

class LessonDetailsScreen extends StatelessWidget {
  const LessonDetailsScreen({super.key});
  static const String LessonDetailsScreenname ='LessonDetailsScreen';
  @override
  Widget build(BuildContext context) {

   List<Lessondmodel> materialmodellist = [
     Lessondmodel(
         imgpath:'assets/images/test rectangle pic.png',
         txt1: 'فيديوهات',
         routename: VideosScreen.VideosScreenname
     ),
     Lessondmodel(
       imgpath:'assets/images/test rectangle pic.png' ,
       txt1: 'ملخصات',
       routename:PdfsScreen.PdfsScreenname ,
     ),
     Lessondmodel(
         imgpath:'assets/images/test rectangle pic.png' ,
         txt1: 'مسائل',
         routename:McqScreen.McqScreenname
     ),



   ];

    return Scaffold(
      appBar: AppBar(
        leading:InkWell(
          onTap: () => Navigator.pop(context),
          child: Row(
            children: [
              SizedBox(width: MediaQuery.of(context).size.width*0.04,),
              Icon(Icons.arrow_back_ios,color:  Colors.deepOrange,),
              Text('Back',style: TextStyle(color: Colors.deepOrange,fontSize: 16,fontWeight: FontWeight.w600),)
            ],
          ),
        ) ,
        leadingWidth: MediaQuery.of(context).size.width*0.4,
        actions: [
          Icon(Icons.notifications,color:  Colors.deepOrange,),
          SizedBox(width: 9,),
          Icon(Icons.person,color:  Colors.deepOrange,),
          SizedBox(width: MediaQuery.of(context).size.width*0.07,),
        ],
      ),
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(image: AssetImage('assets/images/test rectangle pic.png'),
                      fit:  BoxFit.fill
                  )
               ),
              width: MediaQuery.of(context).size.width*0.95,
              height: MediaQuery.of(context).size.height*0.3,
              //child: Image.asset(materialmodel.imgpath,fit: BoxFit.cover,),
            ),
             SizedBox(height: MediaQuery.of(context).size.height*0.02,),
            // Container(
            //     height: MediaQuery.of(context).size.height*0.2,
            //     child: Image.asset('assets/images/logopic..png',fit: BoxFit.fill,)),
            Expanded(
              child: ListView.builder(itemBuilder: (context, index) {
                return LessonDetailsWedget(materialmodel: materialmodellist[index]);
              },
                itemCount: materialmodellist.length,
              ),
            ),
          ],
        ),

      );
  }
}
