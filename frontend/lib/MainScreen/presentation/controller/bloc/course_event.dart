part of 'course_bloc.dart';

abstract class CourseEvent extends Equatable {
  const CourseEvent();

  @override
  List<Object> get props => [];
}

class GetSuggestedCourses extends CourseEvent {}

class GetCourseDetail extends CourseEvent {
  final String id;

  const GetCourseDetail(this.id);
  @override
  List<Object> get props => [id];
}
