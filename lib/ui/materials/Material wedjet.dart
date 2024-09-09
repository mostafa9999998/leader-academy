import 'package:flutter/material.dart';
import 'package:leader_academy/data/repo/modules/packages%20list/PackageResponse.dart';
import 'package:leader_academy/ui/materials%20lessons/materials%20lesson%20screen.dart';
import 'package:leader_academy/ui/utiles/colors.dart';
import 'package:leader_academy/ui/utiles/loading.dart';
import 'package:leader_academy/view%20model/main%20provider.dart';
import 'package:provider/provider.dart';

class MaterialWedget extends StatelessWidget {
   MaterialWedget({super.key,required this.packages});
  // Materialmodel materialmodel ;
   Packages packages;
  @override
  Widget build(BuildContext context) {
    MainProvider mainProvider = Provider.of(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal:  MediaQuery.of(context).size.width*.03,vertical: MediaQuery.of(context).size.height*0.03 ),
      height: MediaQuery.of(context).size.height*0.23,
      margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05,vertical:MediaQuery.of(context).size.height*0.005 ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        image: DecorationImage(
          image: AssetImage('assets/images/test rectangle pic.png'),
          fit: BoxFit.cover,
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(packages.title??"", style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w800),),
          SizedBox(height:  MediaQuery.of(context).size.height*0.01 ,),
          InkWell(
            onTap: () {
             mainProvider.packageid = packages.id!;
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
  }
}

class Materialmodel{
  String imgpath='';
  String txt1='';
  String txt2 = '';
  Materialmodel({required this.imgpath,required  this.txt1,required this.txt2});
}