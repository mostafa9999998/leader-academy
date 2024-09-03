import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter/services.dart';


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

  final String _formUrl = 'https://drive.google.com/file/d/114akduJUfIzbCglBb7NDkj-4erwUeBaZ/preview';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: InAppWebView(
              initialUrlRequest: URLRequest(url: WebUri(_formUrl)),
              onWebViewCreated: (controller) {
                _webViewController = controller;
              },
            ),
          ),
        ],
      ),
    );
  }
}