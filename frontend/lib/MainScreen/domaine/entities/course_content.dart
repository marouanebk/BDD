import 'package:equatable/equatable.dart';

class CourseContent extends Equatable {
  final String name;
  final String type;
  final String? url;
  final String? quiz;

  const CourseContent(
      {required this.name, required this.type, this.url, this.quiz});

  @override
  List<Object?> get props => [name, type, url, quiz];
}
