import 'package:flutter/material.dart';
import 'package:iba_course/course_list/data/course_data.dart';

class CourseDetails extends StatefulWidget {
  final CourseModel obj;
  const CourseDetails({super.key,required this.obj});

  @override
  State<CourseDetails> createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [Text(widget.obj.name)],
      ),
    );
  }
}
