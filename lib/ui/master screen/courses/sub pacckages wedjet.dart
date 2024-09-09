import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leader_academy/data/repo/Api%20manager/Api%20manager.dart';
import 'package:leader_academy/data/repo/modules/packages%20list/PackageResponse.dart';
import 'package:leader_academy/data/repo/modules/packages%20subsciption/PackageSubscription.dart';
import 'package:leader_academy/ui/materials%20lessons/materials%20lesson%20screen.dart';
import 'package:leader_academy/ui/utiles/colors.dart';
import 'package:leader_academy/ui/utiles/loading.dart';

class PackagesSubWedget extends StatelessWidget {
   PackagesSubWedget({super.key,required this.validPackages,required this.token});
   ValidPackages validPackages;
   String token;
  @override
  Widget build(BuildContext context) {
    // will enter teacher id to fun
   return FutureBuilder(
    future:Apimanager.getteacherprofile(token,validPackages.teacherId!) ,
    builder: (context, snapshot) {
    if (snapshot.hasData) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal:  MediaQuery.of(context).size.width*.03,vertical: MediaQuery.of(context).size.height*0.03 ),
        height: MediaQuery.of(context).size.height*0.23,
        margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05,vertical:MediaQuery.of(context).size.height*0.005 ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          image: DecorationImage(
            image: NetworkImage(snapshot.data!.teacher!.image??''),
            fit: BoxFit.cover,
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(validPackages.title??'', style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w800),),
           // SizedBox(height:  MediaQuery.of(context).size.height*0.01 ,),
            Text(snapshot.data!.teacher!.name??'', style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w800),),
            SizedBox(height:  MediaQuery.of(context).size.height*0.01 ,),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, MaterialsLessonScreen.MateriallessonScreenname);
                showcodefield(context, 'code message');
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: ColorApp.secondrycolor,
                ),
                width:MediaQuery.of(context).size.width*0.4 ,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('تصفح الان',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                  ],
                ),
              ),
            )
          ],
        ),
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

class Materialmodel{
  String imgpath='';
  String txt1='';
  String txt2 = '';
  Materialmodel({required this.imgpath,required  this.txt1,required this.txt2});
}