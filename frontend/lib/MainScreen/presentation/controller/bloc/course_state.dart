part of 'course_bloc.dart';

class CourseState extends Equatable {
  final List<Course> getSuggestedCourses;
  final RequestState getSuggestedCoursesState;
  final String getSuggestedCoursesmessage;
  //
  final CourseDetails? getCourseDetail;
  final RequestState getCourseDetailState;
  final String getCourseDetailmessage;

  const CourseState({
    this.getSuggestedCourses = const [],
    this.getSuggestedCoursesState = RequestState.loading,
    this.getSuggestedCoursesmessage = "",

    this.getCourseDetail,
    this.getCourseDetailState = RequestState.loading,
    this.getCourseDetailmessage = "",
  });

  CourseState copyWith({
    List<Course>? getSuggestedCourses,
    RequestState? getSuggestedCoursesState,
    String? getSuggestedCoursesmessage,
    //
    CourseDetails? getCourseDetail,
    RequestState? getCourseDetailState,
    String? getCourseDetailmessage,
    //
  }) {
    return CourseState(
      getSuggestedCourses: getSuggestedCourses ?? this.getSuggestedCourses,
      getSuggestedCoursesState:
          getSuggestedCoursesState ?? this.getSuggestedCoursesState,
      getSuggestedCoursesmessage:
          getSuggestedCoursesmessage ?? this.getSuggestedCoursesmessage,
      //

      getCourseDetail: getCourseDetail ?? this.getCourseDetail,
      getCourseDetailState: getCourseDetailState ?? this.getCourseDetailState,
      getCourseDetailmessage:
          getCourseDetailmessage ?? this.getCourseDetailmessage,
      //
    );
    //
  }

  @override
  List<Object?> get props => [
        getSuggestedCourses,
        getSuggestedCoursesState,
        getSuggestedCoursesmessage,
        //
        getCourseDetail,
        getCourseDetailState,
        getCourseDetailmessage,

        //
      ];
}
