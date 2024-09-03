import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leader_academy/ui/materials/Material%20wedjet.dart';
import 'package:leader_academy/ui/utiles/colors.dart';

class MaterialsScreen extends StatelessWidget {
  const MaterialsScreen({super.key});
  static const String MaterialsScreenname ='MaterialsScreen';
  @override
  Widget build(BuildContext context) {

   List<Materialmodel> materialmodellist = [
     Materialmodel(txt2:'تصفح الان' ,
     imgpath:'assets/images/test rectangle pic.png' ,
     txt1: 'الشهر الاول'),
     Materialmodel(txt2:'تصفح الان' ,
         imgpath:'assets/images/test rectangle pic.png' ,
         txt1: 'الشهر الثانى'),
     Materialmodel(txt2:'تصفح الان' ,
         imgpath:'assets/images/test rectangle pic.png' ,
         txt1: 'الشهر الاول'),
     Materialmodel(txt2:'تصفح الان' ,
         imgpath:'assets/images/test rectangle pic.png' ,
         txt1: 'الشهر الثانى'),
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
        body: Column(
              children: [
                 //SizedBox(height: MediaQuery.of(context).size.height*0.22,),
                // Container(
                //     height: MediaQuery.of(context).size.height*0.2,
                //     child: Image.asset('assets/images/logopic..png',fit: BoxFit.fill,)),
                Expanded(
                  child: ListView.builder(itemBuilder: (context, index) {
                    return MaterialWedget(materialmodel: materialmodellist[index]);
                  },
                    itemCount: materialmodellist.length,
                  ),
                ),
              ],
            ),

      );
  }
}
