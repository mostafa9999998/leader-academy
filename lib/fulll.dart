import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MacAddressWidget extends StatefulWidget {
  @override
  _MacAddressWidgetState createState() => _MacAddressWidgetState();
}

class _MacAddressWidgetState extends State<MacAddressWidget> {


  Future<String?> getMacAddress() async {
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      final AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return androidInfo.id;
    } else if (Platform.isIOS) {
      final IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      return iosInfo.identifierForVendor; // Unique device identifier on iOS
    } else {
      return null; // MAC address not available for other platforms
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future:getMacAddress(),
    builder: (context, snapshot) {
      if (snapshot.hasData){
        return Text('MAC Address: ${snapshot.data}');
      }
      else if(snapshot.hasError){
        return Center(child: Text(snapshot.error.toString()),);
      }
      else {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    },
    );
  }
}


