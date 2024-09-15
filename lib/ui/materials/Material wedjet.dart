import 'package:flutter/material.dart';
import 'package:leader_academy/data/repo/Api%20manager/Api%20manager.dart';
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
          opacity: 10,
          image: AssetImage('assets/images/rect student in class.png'),
          fit: BoxFit.cover,
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(packages.title??"", style: TextStyle(color: Colors.white,fontSize: 32,fontWeight: FontWeight.bold),),
          SizedBox(height:  MediaQuery.of(context).size.height*0.01 ,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () async {
                 mainProvider.packageid = packages.id!;
                  mainProvider.macaddress = await Apimanager.getMacAddress()??'0000';
                var checkresponse = await Apimanager.checkcode(mainProvider.loginResponse.token!, mainProvider.loginResponse.user!.id!, mainProvider.packageid,mainProvider.macaddress );
                if (checkresponse.message == "No code found for this user and package."){
                  showcodefield(context, 'enter code.',"code !");
                }
                else if (checkresponse.message == "MAC address mismatch."){
                  showcodefield(context,'enter code.', 'MAC address mismatch.');
                }
                else if (checkresponse.message == "Code has expired."){
                  showcodefield(context,'enter code.', 'Code has expired.');
                }
                else if (checkresponse.message == "User has a valid code."){
                  Navigator.pushNamed(context, MaterialsLessonScreen.MateriallessonScreenname);
                }
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
              ),
            ],
          )
        ],
      ),
    );
  }
}

