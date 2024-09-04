import 'package:flutter/material.dart';
import 'package:leader_academy/ui/lesson%20details/lesson%20details%20screen.dart';
import 'package:leader_academy/ui/lesson%20details/mcq/mcq%20screen.dart';
import 'package:leader_academy/ui/lesson%20details/pdfs/pdfplay.dart';
import 'package:leader_academy/ui/lesson%20details/pdfs/pdfs%20screen.dart';
import 'package:leader_academy/ui/lesson%20details/videos/videosplay.dart';
import 'package:leader_academy/ui/lesson%20details/videos/videos%20screen.dart';
import 'package:leader_academy/ui/login/login_screen.dart';
import 'package:leader_academy/ui/master%20screen/master%20screen.dart';
import 'package:leader_academy/ui/materials%20lessons/materials%20lesson%20screen.dart';
import 'package:leader_academy/ui/materials/materials%20screen.dart';
import 'package:leader_academy/ui/register/register_screen.dart';
import 'package:leader_academy/ui/teacher%20profile/profile%20Screen.dart';
import 'package:leader_academy/ui/testmacaddress.dart';
import 'package:leader_academy/view%20model/main%20provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  MainProvider provider = MainProvider();
  // Lock the orientation to portrait mode (you can also choose landscape)
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(ChangeNotifierProvider(
        create: (context) => provider, child: const MyApp()));
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    MainProvider mainProvider = MainProvider();
    return ChangeNotifierProvider(
      create:(context) => mainProvider,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Loginscreen.loginroutename,
       // initialRoute: ProfileScreen.ProfileScreenname,
        routes: {
          Loginscreen.loginroutename : (_) => Loginscreen(),
          RegisterScreen.regroutename :(_) => RegisterScreen(),
          MaterialsScreen.MaterialsScreenname : (_) => MaterialsScreen(),
          MaterialsLessonScreen.MateriallessonScreenname :(_) => MaterialsLessonScreen(),
          LessonDetailsScreen.LessonDetailsScreenname : (_) => LessonDetailsScreen(),
          VideosScreen.VideosScreenname : (_) => VideosScreen(),
          McqScreen.McqScreenname : (_) => McqScreen(),
          PlayVideoScreen.YoutubePlayVideoScreenname :(_)=> PlayVideoScreen(),
          PdfsScreen.PdfsScreenname : (_)=> PdfsScreen(),
          PdfPlayScreen.PdfPlayScreenname :(_) => PdfPlayScreen(Pdhurl: '',),
          MacAddresScren.MacAddresScrenname : (_)=> MacAddresScren(),
          //TeacherScreen.TeacherScreenname : (_)=> TeacherScreen()
          MasterScreen.masterScreenname : (_)=> MasterScreen(),
          ProfileScreen.ProfileScreenname : (_) => ProfileScreen()

        },
      ),
    );
  }
}
