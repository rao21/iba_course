class CourseModel {
  final String name;
  final String code;
  final String tech;
  final String description;
  final String icon;
  final List<LecturesModel> lecture;
  CourseModel(
      {required this.name,
      required this.code,
      required this.tech,
      required this.icon,
      this.description = '',
      required this.lecture});
}

class LecturesModel {
  final String name;
  final String link;
  LecturesModel({
    required this.name,
    required this.link,
  });
}
