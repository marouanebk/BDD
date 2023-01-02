// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

class CourseContent extends Equatable {
  final String name;
  final String type;
  final String? url;
  final List<String>? quizzContent;

  const CourseContent({
    required this.name,
    required this.type,
    this.url,
    this.quizzContent,
  });

  @override
  List<Object?> get props => [name, type, url, quizzContent];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'type': type,
      'url': url,
      'quizzContent': quizzContent,
    };
  }
}
