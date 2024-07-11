import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leader_academy/ui/lesson%20details/pdfs/pdf%20wedjet.dart';

class PdfsScreen extends StatelessWidget {
  const PdfsScreen({super.key});
  static const String PdfsScreenname ='PdfsScreen';
  @override
  Widget build(BuildContext context) {

   List<Pdfmodel> materialmodellist = [
     Pdfmodel(url: 'https://www.bbau.ac.in/Docs/FoundationCourse/TM/AECC105/Grammar.pdf',name: 'pdf 1'),
     Pdfmodel(url: 'https://catalogimages.wiley.com/images/db/pdf/047168449X.excerpt.pdf',name: 'pdf 2'),
     Pdfmodel(url: 'https://drive.google.com/file/d/11sztTtGr0Fqd-jBcievWZlvXei1Om6wz/view?usp=drive_link',name: 'pdf 3'),
   ];

    return Scaffold(
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(itemBuilder: (context, index) {
                print( materialmodellist.length);
                return PdfsWedget(materialmodel: materialmodellist[index]);
              },
                itemCount: materialmodellist.length,
              ),
            ),
          ],
        ),

      );
  }
}
