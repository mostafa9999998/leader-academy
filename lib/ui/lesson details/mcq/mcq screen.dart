import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:leader_academy/view%20model/main%20provider.dart';
import 'package:provider/provider.dart';

class McqScreen extends StatefulWidget {
  const McqScreen({super.key});
  static const String McqScreenname = 'McqScreen';

  @override
  State<McqScreen> createState() => _McqScreenState();
}

class _McqScreenState extends State<McqScreen> {
  late InAppWebViewController _webViewController;

  @override
  Widget build(BuildContext context) {
    MainProvider provider = Provider.of(context);
    final String _formUrl = 'https://mr-ashraf-abed.hwnix.com/AssignmentsPage2/${provider.lessonid}';

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