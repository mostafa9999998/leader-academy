import 'package:flutter/material.dart';
import 'package:leader_academy/ui/materials%20lessons/lesson%20container.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
     child: LessonContainer(),
    );
  }
}
