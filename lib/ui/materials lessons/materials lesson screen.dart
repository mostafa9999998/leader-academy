import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leader_academy/data/repo/Api%20manager/Api%20manager.dart';
import 'package:leader_academy/ui/materials%20lessons/lesson%20wedjet.dart';
import 'package:leader_academy/ui/utiles/colors.dart';
import 'package:leader_academy/view%20model/main%20provider.dart';
import 'package:provider/provider.dart';

class MaterialsLessonScreen extends StatelessWidget {
  const MaterialsLessonScreen({super.key});
  static const String MateriallessonScreenname ='MaterialsLessonScreen';
  @override
  Widget build(BuildContext context) {

    MainProvider mainProvider = Provider.of(context);

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
            FutureBuilder(
              future: Apimanager.getlessons(mainProvider.packageid),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return LessonWedget(
                          lessons: snapshot.data!.lessons![index],
                        );
                      },
                      itemCount: snapshot.data!.lessons!.length,
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
            ),

          ],
        ),
      );
  }
}
