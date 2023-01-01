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

class AddCourseEvent extends CourseEvent {
  final CourseDetails courseDetails;

  const AddCourseEvent(this.courseDetails);
  @override
  List<Object> get props => [courseDetails];
}

class GetCoursesByTeacherEvent extends CourseEvent {
  final String id;

  const GetCoursesByTeacherEvent(this.id);
  @override
  List<Object> get props => [id];
}

class AddChapterEvent extends CourseEvent {
  final CourseContent courseContent;
  final String id;

  const AddChapterEvent(this.courseContent, this.id);
  @override
  List<Object> get props => [courseContent, id];
}
