import 'package:flutter/material.dart';

class TeacherWedjet extends StatelessWidget {
  const TeacherWedjet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              backgroundImage: AssetImage(
                'assets/images/avatar-icon-human.jpg',
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .005,
          ),
          Center(
              child: Text(
                'Mr/ashraf abed',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: Colors.blue),
              )),
          Center(
              child: Text(
                'english',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600,color: Color(0xff4D4D4D)),
              )),
        ],
      ),
    );
  }
}
