import 'package:flutter/material.dart';
import 'package:leader_academy/fulll.dart';
import 'package:leader_academy/ui/lesson%20details/lesson%20details%20screen.dart';
import 'package:leader_academy/ui/lesson%20details/mcq/mcq%20screen.dart';
import 'package:leader_academy/ui/lesson%20details/pdfs/pdfplay.dart';
import 'package:leader_academy/ui/lesson%20details/pdfs/pdfs%20screen.dart';
import 'package:leader_academy/ui/lesson%20details/videos/videosplay.dart';
import 'package:leader_academy/ui/lesson%20details/videos/videos%20screen.dart';
import 'package:leader_academy/ui/login/login_screen.dart';
import 'package:leader_academy/ui/materials%20lessons/materials%20lesson%20screen.dart';
import 'package:leader_academy/ui/materials/materials%20screen.dart';
import 'package:leader_academy/ui/register/register_screen.dart';
import 'package:leader_academy/ui/testmacaddress.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Loginscreen.loginroutename,
      routes: {
        Loginscreen.loginroutename : (_) => Loginscreen(),
        RegisterScreen.regroutename :(_) => RegisterScreen(),
        MaterialsScreen.MaterialsScreenname : (_) => MaterialsScreen(),
        MaterialsLessonScreen.MateriallessonScreenname :(_) => MaterialsLessonScreen(),
        LessonDetailsScreen.LessonDetailsScreenname : (_) => LessonDetailsScreen(),
        VideosScreen.VideosScreenname : (_) => VideosScreen(),
        McqScreen.McqScreenname : (_) => McqScreen(),
        YoutubePlayVideoScreen.YoutubePlayVideoScreenname :(_)=> YoutubePlayVideoScreen(videoUrl: '',),
        PdfsScreen.PdfsScreenname : (_)=> PdfsScreen(),
        PdfPlayScreen.PdfPlayScreenname :(_) => PdfPlayScreen(Pdhurl: '',),
        MacAddresScren.MacAddresScrenname : (_)=> MacAddresScren(),

      },
    );
  }
}
