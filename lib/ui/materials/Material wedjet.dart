import 'package:flutter/material.dart';
import 'package:leader_academy/ui/materials%20lessons/materials%20lesson%20screen.dart';
import 'package:leader_academy/ui/utiles/colors.dart';
import 'package:leader_academy/ui/utiles/loading.dart';

class MaterialWedget extends StatelessWidget {
   MaterialWedget({super.key,required this.materialmodel});
  Materialmodel materialmodel ;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal:  MediaQuery.of(context).size.width*.03,vertical: MediaQuery.of(context).size.height*0.03 ),
      height: MediaQuery.of(context).size.height*0.23,
      margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05,vertical:MediaQuery.of(context).size.height*0.005 ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        image: DecorationImage(
          image: AssetImage(materialmodel.imgpath),
          fit: BoxFit.cover,
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(materialmodel.txt1, style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w800),),
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
                  Text(materialmodel.txt2,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
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