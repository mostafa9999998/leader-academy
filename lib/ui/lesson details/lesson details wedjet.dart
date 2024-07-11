import 'package:flutter/material.dart';

class LessonDetailsWedget extends StatelessWidget {
   LessonDetailsWedget({super.key,required this.materialmodel});
   Lessondmodel materialmodel ;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, materialmodel.routename);
      },
      child: Container(

        padding: EdgeInsets.symmetric(horizontal:  MediaQuery.of(context).size.width*.02,vertical: MediaQuery.of(context).size.height*0.015 ),
        height: MediaQuery.of(context).size.height*0.11,
        margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05,vertical:MediaQuery.of(context).size.height*0.009 ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(.5),
                spreadRadius: 1,
                blurRadius: 7,
                offset: Offset(3.0,5.0)
            )
          ],
        ),
        child: Row(
           mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(materialmodel.txt1, style: TextStyle(color: Colors.black,fontSize: 21,fontWeight: FontWeight.w800),),
            SizedBox(width: MediaQuery.of(context).size.width*0.08 ,),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(image: AssetImage(materialmodel.imgpath),
                    fit:  BoxFit.cover
                    )
              ),
              width: MediaQuery.of(context).size.width*0.2,
              height: MediaQuery.of(context).size.height*0.1,
            )
          ],
        ),
      ),
    );
  }
}

class Lessondmodel{
  String imgpath='';
  String txt1='';
  String routename='';
  Lessondmodel({required this.imgpath,required  this.txt1,required this.routename});
}