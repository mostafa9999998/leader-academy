import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leader_academy/data/repo/Api%20manager/Api%20manager.dart';
import 'package:leader_academy/data/repo/modules/packages%20subsciption/PackageSubscription.dart';
import 'package:leader_academy/ui/materials%20lessons/materials%20lesson%20screen.dart';
import 'package:leader_academy/ui/utiles/colors.dart';
import 'package:leader_academy/ui/utiles/loading.dart';
import 'package:leader_academy/view%20model/main%20provider.dart';
import 'package:provider/provider.dart';

class PackagesSubWedget extends StatelessWidget {
  PackagesSubWedget(
      {super.key, required this.validPackages, required this.token});
  ValidPackages validPackages;
  String token;
  @override
  Widget build(BuildContext context) {
    MainProvider mainProvider = Provider.of(context);
    // will enter teacher id to fun
    return FutureBuilder(
      future: Apimanager.getteacherprofile(token, validPackages.teacherId!),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * .06,
                vertical: MediaQuery.of(context).size.height * 0.03),
            height: MediaQuery.of(context).size.height * 0.23,
            margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05,
                vertical: MediaQuery.of(context).size.height * 0.005),

            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                image: DecorationImage(
                  opacity: 10,
                  image: AssetImage('assets/images/rect mob and boy.png'),
                  // image: NetworkImage(snapshot.data!.teacher!.image ?? ''),
                  fit: BoxFit.cover,
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // SizedBox(height:  MediaQuery.of(context).size.height*0.01 ,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      validPackages.title ?? '',
                      style: TextStyle(
                        color: ColorApp.secondrycolor,
                        fontSize: 24,
                        fontWeight: FontWeight.w800,),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      snapshot.data!.teacher!.name ?? '',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w800),
                    ),
                      SizedBox(
                        width: 10,
                      ),
                    Container(
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            snapshot.data!.teacher!.image ?? ''
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start ,
                  children: [
                    InkWell(
                      onTap: () async {
                        mainProvider.packageid = validPackages.id!;
                        mainProvider.macaddress =
                            await Apimanager.getMacAddress() ?? '0000';
                        var checkresponse = await Apimanager.checkcode(
                            mainProvider.loginResponse.token!,
                            mainProvider.loginResponse.user!.id!,
                            mainProvider.packageid,
                            mainProvider.macaddress);
                        if (checkresponse.message ==
                            "No code found for this user and package.") {
                          showcodefield(context, 'enter code.', "");
                        } else if (checkresponse.message ==
                            "MAC address mismatch.") {
                          showcodefield(
                              context, 'enter code.', 'MAC address mismatch.');
                        } else if (checkresponse.message == "Code has expired.") {
                          showcodefield(
                              context, 'enter code.', 'Code has expired.');
                        } else if (checkresponse.message ==
                            "User has a valid code.") {
                          Navigator.pushNamed(context,
                              MaterialsLessonScreen.MateriallessonScreenname);
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: ColorApp.secondrycolor,
                        ),
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'تصفح الان',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              'Some thing went wrong',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
            ),
          );
        } else {
          return Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
              ),
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
