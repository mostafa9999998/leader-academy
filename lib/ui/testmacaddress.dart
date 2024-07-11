import 'package:flutter/material.dart';
import '../fulll.dart';

class MacAddresScren extends StatelessWidget {
  const MacAddresScren({super.key});
static const String MacAddresScrenname = 'MacAddresScren';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MAC Address Example'),
      ),
      body: Center(
        child: MacAddressWidget(),
      ),
    );
  }
}
