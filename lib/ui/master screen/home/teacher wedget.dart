import 'package:flutter/material.dart';
import 'package:leader_academy/data/repo/modules/teachers%20list/TeachersResponse.dart';
import 'package:leader_academy/ui/teacher%20profile/profile%20Screen.dart';
import 'package:leader_academy/view%20model/main%20provider.dart';
import 'package:provider/provider.dart';


class TeacherWedjet extends StatelessWidget {
   TeacherWedjet({super.key, required this.teachers});
  Teachers teachers;
  @override
  Widget build(BuildContext context) {
    MainProvider mainProvider= Provider.of(context);
    return InkWell(
      onTap: () {
        mainProvider.teacherid = teachers.id?? 1 ;
        Navigator.pushNamed(context, ProfileScreen.ProfileScreenname);
      },
      child: Container(
        width: MediaQuery.of(context).size.width*.4,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color(0x89e3e2e2)
        ),
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Center(
              child: CircleAvatar(
                radius: 35,
                backgroundImage: NetworkImage(
                  teachers.fullSrc??'',
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .005,
            ),
            Center(
                child: Text(
                 teachers.name??'',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: Colors.blue),
                )),
            Center(
                child: Text(
                  teachers.subject??"",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600,color: Color(0xff4D4D4D)),
                )),
          ],
        ),
      ),
    );
  }
}
