import 'package:flutter/material.dart';
import 'package:leader_academy/ui/login/login_screen.dart';
import 'package:leader_academy/ui/master%20screen/master%20screen.dart';
import 'package:leader_academy/view%20model/main%20provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


class DisplayWedget extends StatefulWidget {
  const DisplayWedget({super.key});
  static String diplayname = 'DisplayWedgetname';

  @override
  State<DisplayWedget> createState() => _DisplayWedgetState();
}

class _DisplayWedgetState extends State<DisplayWedget> {
  @override
  String? userinfo;
  bool initial =true;

  Widget build(BuildContext context) {

    MainProvider provider =Provider.of<MainProvider>(context);
    if (initial){
      SharedPreferences.getInstance().then((value) {
        setState(()  {
          initial=false;
          //await
          userinfo = value.getString('login5key');
          provider.loading();
        });
      });
      return Center(child: CircularProgressIndicator());
    }else if (userinfo != null){
      return MasterScreen();
    }else {
      return Loginscreen();
    }


  }
}
