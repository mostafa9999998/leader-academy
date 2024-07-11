import 'package:flutter/material.dart';
import 'package:leader_academy/ui/lesson%20details/pdfs/pdfplay.dart';
import 'package:leader_academy/ui/lesson%20details/videos/videosplay.dart';

class PdfsWedget extends StatefulWidget {
   PdfsWedget({super.key,required this.materialmodel});
   Pdfmodel materialmodel ;

  @override
  State<PdfsWedget> createState() => _PdfsWedgetState();
}

class _PdfsWedgetState extends State<PdfsWedget> {


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
              Navigator.push(context, MaterialPageRoute(builder: (context) => PdfPlayScreen(Pdhurl: widget.materialmodel.url),));
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

class Pdfmodel{
  String url='';
  String name='';
  Pdfmodel({required this.url,required this.name});
}