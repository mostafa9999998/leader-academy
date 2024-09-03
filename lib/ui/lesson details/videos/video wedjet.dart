import 'package:flutter/material.dart';


class VideoWedget extends StatefulWidget {
   VideoWedget({super.key,required this.materialmodel});
   vediosmodel materialmodel ;

  @override
  State<VideoWedget> createState() => _VideoWedgetState();
}

class _VideoWedgetState extends State<VideoWedget> {
  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.only(
          right: MediaQuery.of(context).size.width * .05,
          top: MediaQuery.of(context).size.height * .04,
          left: MediaQuery.of(context).size.width * .05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.materialmodel.name,
            style:
            TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .03,
          ),
          InkWell(
            onTap: () {
             // Navigator.push(context, MaterialPageRoute(builder: (context) => PlayVideoScreen(videoUrl:widget.materialmodel.url ),));
            },
            child: Container(
              height: MediaQuery.of(context).size.height*0.2,
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*.008),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: AssetImage('assets/images/test rectangle pic.png'),
                  fit: BoxFit.fill
                )
              ),
            ),
          ),

        ],
      ),
    );
  }
}

class vediosmodel{
  String url='';
  String name='';
  vediosmodel({required this.url,required this.name});
}