import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter/services.dart';
import 'package:leader_academy/data/repo/Api%20manager/Api%20manager.dart';
import 'package:leader_academy/view%20model/main%20provider.dart';
import 'package:provider/provider.dart';


class PlayVideoScreen extends StatefulWidget {
  PlayVideoScreen({super.key});
  static const String YoutubePlayVideoScreenname = 'YoutubePlayVideoScreen';
  //String videoUrl ;
  @override
  _PlayVideoScreenState createState() => _PlayVideoScreenState();
}

class _PlayVideoScreenState extends State<PlayVideoScreen> {

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

  final  String _formUrl = 'https://drive.google.com/file/d/114akduJUfIzbCglBb7NDkj-4erwUeBaZ/preview';


  @override
  Widget build(BuildContext context) {

    MainProvider provider = Provider.of(context);

       return FutureBuilder(
         future: Apimanager.getvideo(provider.loginResponse.token!,provider.lessonid),
         builder: (context, snapshot) {
           if (snapshot.hasData) {
             return Scaffold(
                 body: Column(
                   children: [
                     Expanded(
                       child: InAppWebView(
                         initialUrlRequest: URLRequest(url: WebUri(snapshot.data?[0].url??'')),
                         onWebViewCreated: (controller) {
                           _webViewController = controller;
                         },
                       ),
                     ),
                   ],
                 ),
               );
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

  }
}