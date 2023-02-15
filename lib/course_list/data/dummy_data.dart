import 'package:iba_course/course_list/data/course_data.dart';

List<CourseModel> data = [
  CourseModel(
      code: 'CE405',
      name: 'Mobile App Development',
      tech: 'Flutter',
      description:
          'In this course we learn about mobile application development.',
      icon: 'assets/icons/flutter.svg',
      lecture: [
        LecturesModel(
            link: 'https://www.youtube.com/watch?v=fq4N0hgOWzU',
            name: 'Introduction to Flutter'),
        LecturesModel(
            link: 'https://www.youtube.com/watch?v=fq4N0hgOWzU',
            name: 'Introduction to Flutter')
      ]),
  CourseModel(
      code: 'CE406',
      name: 'Backend Development',
      tech: 'Nodejs',
      description: 'In this course we learn about backend development.',
      icon: 'assets/icons/nodejs.svg',
      lecture: [
        LecturesModel(
            link: 'https://www.youtube.com/watch?v=fq4N0hgOWzU',
            name: 'Introduction to BE development')
      ])
];
