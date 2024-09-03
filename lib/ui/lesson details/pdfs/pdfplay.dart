import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:internet_file/internet_file.dart';
import 'package:pdfx/pdfx.dart';


class PdfPlayScreen extends StatefulWidget {
   PdfPlayScreen({super.key,required this.Pdhurl});
  static const String PdfPlayScreenname ='PdfPlayScreen';
  String Pdhurl  ;

  @override
  State<PdfPlayScreen> createState() => _PdfPlayScreenState();
}

class _PdfPlayScreenState extends State<PdfPlayScreen> {
 static const int initialpage =1;
 late PdfControllerPinch pdfControllerPinch;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
pdfControllerPinch = PdfControllerPinch(document: PdfDocument.openData(
InternetFile.get(widget.Pdhurl)
),
    initialPage: initialpage
);
  }

@override
  void dispose() {
    // TODO: implement dispose
  pdfControllerPinch.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('pdf'),
      ),
      body:PdfViewPinch(
        controller: pdfControllerPinch,
        scrollDirection: Axis.vertical,
        builders: PdfViewPinchBuilders<DefaultBuilderOptions>(
          options:const DefaultBuilderOptions(),
          documentLoaderBuilder: (_)=> Center(
            child: CircularProgressIndicator(),
          ),
          pageLoaderBuilder: (_)=> Center(
            child: CircularProgressIndicator(),
          ),
          errorBuilder: (_,error)=> Center(child: Text(error.toString(),style: TextStyle(color: Colors.cyanAccent),),)
        ),
      )
    );
  }
}
