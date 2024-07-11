import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class McqScreen extends StatefulWidget {
  const McqScreen({super.key});
  static const String McqScreenname = 'McqScreen';

  @override
  State<McqScreen> createState() => _McqScreenState();
}

class _McqScreenState extends State<McqScreen> {
  late InAppWebViewController _webViewController;
  final String _formUrl = 'https://fxcit0a6o87.typeform.com/to/N3n4oKYi';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Form'),
      ),
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