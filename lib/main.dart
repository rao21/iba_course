import 'package:flutter/material.dart';
import 'package:iba_course/course_list/view/course_list.dart';
import 'package:iba_course/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        // When navigating to the "/second" route, build the SecondScreen widget.
        //'/home': (context) => const CourseListWidget(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Scaffold(body: MobileLoginForm()),
    );
  }
}
