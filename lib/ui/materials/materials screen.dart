import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leader_academy/ui/materials/Material%20wedjet.dart';

class MaterialsScreen extends StatelessWidget {
  const MaterialsScreen({super.key});
  static const String MaterialsScreenname ='MaterialsScreen';
  @override
  Widget build(BuildContext context) {

   List<Materialmodel> materialmodellist = [
     Materialmodel(txt2:'تصفح الان' ,
     imgpath:'assets/images/test rectangle pic.png' ,
     txt1: 'رياضيات'),
     Materialmodel(txt2:'تصفح الان' ,
         imgpath:'assets/images/test rectangle pic.png' ,
         txt1: 'فيزياء'),
     Materialmodel(txt2:'تصفح الان' ,
     imgpath:'assets/images/test rectangle pic.png' ,
     txt1: 'رياضيات'),
     Materialmodel(txt2:'تصفح الان' ,
         imgpath:'assets/images/test rectangle pic.png' ,
         txt1: 'فيزياء'),
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
                    return MaterialWedget(materialmodel: materialmodellist[index]);
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
