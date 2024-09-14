import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:leader_academy/data/repo/Api%20manager/Api%20manager.dart';
import 'package:leader_academy/ui/master%20screen/home/teacher%20wedget.dart';
import 'package:leader_academy/ui/utiles/colors.dart';
import 'package:leader_academy/view%20model/main%20provider.dart';
import 'package:provider/provider.dart';


class Home extends StatefulWidget {
   Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
   List<Image> imagelist = [
     Image.asset(
       'assets/images/test rectangle pic.png',
       fit: BoxFit.cover,

     ),
     Image.asset(
       'assets/images/test rectangle pic.png',
       fit: BoxFit.cover,
     ),
     Image.asset(
       'assets/images/test rectangle pic.png',
       fit: BoxFit.cover,
     ),
   ];

   int currentpage = 1;

  @override
  Widget build(BuildContext context) {
    MainProvider provider =Provider.of(context);
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height*.02,),
            FutureBuilder(
              future: Apimanager.getimagelist(provider.loginResponse.token!),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return  Container(
                    height: MediaQuery.of(context).size.height*.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                    //  color: Colors.lightGreen
                    ),
                    padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*.05),
                    child: ImageSlideshow(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.width*.5,
                      initialPage: 0,
                      indicatorColor: ColorApp.primarycolor,
                      indicatorBackgroundColor: Colors.white,
                      indicatorPadding: 10,
                      children: snapshot.data!.map((e) => Image.network((e.fullSrc)??'',fit: BoxFit.cover,)).toList(),

                      /// Called whenever the page in the center of the viewport changes.
                      onPageChanged: (value) {
                        print('Page changed: $value');
                        currentpage = value + 1  ;
                      },
                      autoPlayInterval: 3000,
                      isLoop: true,
                      disableUserScrolling:true,
                    ),
                  );
                } else if (snapshot.hasError) {
                  return  Container(
                    height: MediaQuery.of(context).size.height*.2,
                    child: Center(
                      child: Text(
                        'Some thing went wrong',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w800),
                      ),
                    ),
                  );;
                } else {
                  return Column(
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
            SizedBox(height: MediaQuery.of(context).size.height*.02,),
            Center(child: Text('ابحث عن كوسات',style: TextStyle(color: ColorApp.secondrycolor,fontWeight: FontWeight.w800,fontSize: 22),)),
            //SizedBox(height: MediaQuery.of(context).size.height*.01,),
            Center(child: Text('''حالياا تقدر تلاقى جميع موادك مع افضل \n                و اكفأ المدرسين''',style: TextStyle(color: ColorApp.primarycolor,fontWeight: FontWeight.w400,fontSize: 18),)),
            SizedBox(height: MediaQuery.of(context).size.height*.02,),
            Container(
              width: MediaQuery.sizeOf(context).width*0.9,
              height:MediaQuery.sizeOf(context).width*0.13 ,
              margin: EdgeInsets.symmetric(horizontal: 60),
              child: ElevatedButton(onPressed: (){
                provider.currentindex = 1;
                provider.notifyListeners();
              },
                child: Text('ابحث عن مدرس',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color: Colors.white),),
                style: ElevatedButton.styleFrom(
                    backgroundColor:Color(0xff0F0C80),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*.02,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text( 'المدرسين الاكثر جهورا ',
                  style: TextStyle(color: ColorApp.primarycolor,fontWeight: FontWeight.w800,fontSize: 24),
                ),
              ],
            ),
            Container(
              //padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TeacherWedjet(),
                    TeacherWedjet(),
                  ],
                ),
              ),
            )

          ],
        ),
      ),
    ) ;
  }
}