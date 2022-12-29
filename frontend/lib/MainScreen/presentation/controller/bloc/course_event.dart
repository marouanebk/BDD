part of 'course_bloc.dart';

abstract class CourseEvent extends Equatable {
  const CourseEvent();

  @override
  List<Object> get props => [];
}

class GetSuggestedCoursesEvent extends CourseEvent {}

class GetCourseDetailEvent extends CourseEvent {
  final String id;

  const GetCourseDetailEvent(this.id);
  @override
  List<Object> get props => [id];
}
