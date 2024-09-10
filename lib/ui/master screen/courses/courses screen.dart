import 'package:flutter/material.dart';
import 'package:leader_academy/data/repo/Api%20manager/Api%20manager.dart';
import 'package:leader_academy/ui/master%20screen/courses/sub%20pacckages%20wedjet.dart';
import 'package:leader_academy/view%20model/main%20provider.dart';
import 'package:provider/provider.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {

    MainProvider provider = Provider.of(context);
print(provider.loginResponse.user!.id!);
    return FutureBuilder(
      future: Apimanager.getpackagessubscription(provider.loginResponse.token!,provider.loginResponse.user!.id!),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
           child: Column(
             children: [
               SizedBox(height: MediaQuery.of(context).size.height*0.0,),
                Expanded(
               child: ListView.builder(
               itemBuilder: (context, index) {
               return PackagesSubWedget(
               validPackages: snapshot.data!.validPackages![index],
               token: provider.loginResponse.token!,
               );
               },
               itemCount: snapshot.data!.validPackages!.length,
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
