import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leader_academy/ui/lesson%20details/videos/video%20wedjet.dart';

class VideosScreen extends StatelessWidget {
  const VideosScreen({super.key});
  static const String VideosScreenname ='VideosScreen';
  @override
  Widget build(BuildContext context) {

   List<vediosmodel> materialmodellist = [
     vediosmodel(url: 'https://youtu.be/3vJ-nHTX9iI',name: 'video 1'),
     vediosmodel(url: 'https://drive.google.com/file/d/1Qbek2mC9jtb0YSr5_J9-acu8CPs-e9x0/view',name: 'video 2'),
   ];

    return Scaffold(
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(itemBuilder: (context, index) {
                print( materialmodellist.length);
                return VideoWedget(materialmodel: materialmodellist[index]);
              },
                itemCount: materialmodellist.length,
              ),
            ),
          ],
        ),

      );
  }
}
