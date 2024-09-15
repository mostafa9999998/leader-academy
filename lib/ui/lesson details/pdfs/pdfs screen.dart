import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leader_academy/data/repo/Api%20manager/Api%20manager.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter/services.dart';
import 'package:leader_academy/view%20model/main%20provider.dart';
import 'package:provider/provider.dart';

class PdfsScreen extends StatefulWidget {
  const PdfsScreen({super.key});
  static const String PdfsScreenname ='PdfsScreen';

  @override
  State<PdfsScreen> createState() => _PdfsScreenState();
}

class _PdfsScreenState extends State<PdfsScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }


  late InAppWebViewController _webViewController;
  @override
  Widget build(BuildContext context) {

    MainProvider provider = Provider.of(context);

    return FutureBuilder(
      future: Apimanager.getpdfs(provider.loginResponse.token!,provider.lessonid),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.message =='No PDFs found for this lesson.'){
            return Scaffold(
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 Text('No PDFs found for this lesson.',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),)
                ],
              ),
            );
          }else{
            return Scaffold(
              body: Column(
                children: [
                  Expanded(
                    child: InAppWebView(
                      initialUrlRequest: URLRequest(url: WebUri(snapshot.data!.pdfs![0].pdf??'')),
                      // initialUrlRequest: URLRequest(url: WebUri('https://drive.google.com/file/d/11sztTtGr0Fqd-jBcievWZlvXei1Om6wz/view?usp=drivesdk')),
                      onWebViewCreated: (controller) {
                        _webViewController = controller;
                      },
                    ),
                  ),
                ],
              ),
            );
          }

        } else if (snapshot.hasError) {
          print(provider.lessonid);
          return Scaffold(
            body: Center(
              child: Text(
                'Some thing went wrong',
                style: TextStyle(
                    fontSize: 22, fontWeight: FontWeight.w800),
              ),
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
       // return FutureBuilder(
       //   future: Apimanager.getpdfs("token", 1),
       //     builder: (context, snapshot) {
       //       if(snapshot.hasData){
       //         return Container(
       //           child:PdfPlayScreen(Pdhurl: snapshot.data!.pdfs![0].pdf??'',) ,
       //         );
       //       }else if (snapshot.hasError) {
       //         return Center(
       //           child: Text("Some thing went wrong"),
       //         );
       //       }else {
       //        return Center(
       //           child: CircularProgressIndicator(),
       //         );
       //       }
       //     },
       //
       // );
    // return Scaffold(
    //     body: Column(
    //       children: [
    //         Expanded(
    //           child: ListView.builder(itemBuilder: (context, index) {
    //             print( materialmodellist.length);
    //             return PdfsWedget(materialmodel: materialmodellist[index]);
    //           },
    //             itemCount: materialmodellist.length,
    //           ),
    //         ),
    //       ],
    //     ),
    //
    //   );
  }
}
