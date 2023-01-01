part of 'course_bloc.dart';

class CourseState extends Equatable {
  final List<Course> getSuggestedCourses;
  final RequestState getSuggestedCoursesState;
  final String getSuggestedCoursesmessage;

  //
  final CourseDetails? getCourseDetail;
  final RequestState getCourseDetailState;
  final String getCourseDetailmessage;

  final RequestState addCoruseState;
  final String addCourseMessage;
  final bool addCourseSuccess;

  final RequestState addChapterState;
  final String addChapterMessage;
  final bool addChapterSuccess;

  final List<Course> getCoursesByTeacher;
  final RequestState getCoursesByTeacherState;
  final String getCoursesByTeachermessage;

  const CourseState({
    this.getSuggestedCourses = const [],
    this.getSuggestedCoursesState = RequestState.loading,
    this.getSuggestedCoursesmessage = "",
    //
    this.getCourseDetail,
    this.getCourseDetailState = RequestState.loading,
    this.getCourseDetailmessage = "",
    //
    this.addCoruseState = RequestState.loading,
    this.addCourseMessage = "",
    this.addCourseSuccess = false,
    //
    this.addChapterState = RequestState.loading,
    this.addChapterMessage = "",
    this.addChapterSuccess = false,
    //

    this.getCoursesByTeacher = const [],
    this.getCoursesByTeacherState = RequestState.loading,
    this.getCoursesByTeachermessage = "",
  });

  CourseState copyWith({
    List<Course>? getSuggestedCourses,
    RequestState? getSuggestedCoursesState,
    String? getSuggestedCoursesmessage,
    //
    CourseDetails? getCourseDetail,
    RequestState? getCourseDetailState,
    String? getCourseDetailmessage,
    RequestState? addCoruseState,
    String? addCourseMessage,
    bool? addCourseSuccess,
    RequestState? addChapterState,
    String? addChapterMessage,
    bool? addChapterSuccess,
    //
    List<Course>? getCoursesByTeacher,
    RequestState? getCoursesByTeacherState,
    String? getCoursesByTeachermessage,

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
      addCoruseState: addCoruseState ?? this.addCoruseState,
      addCourseMessage: addCourseMessage ?? this.addCourseMessage,
      addCourseSuccess: addCourseSuccess ?? this.addCourseSuccess,
      //

      getCoursesByTeacher: getCoursesByTeacher ?? this.getCoursesByTeacher,

      getCoursesByTeacherState:
          getCoursesByTeacherState ?? this.getCoursesByTeacherState,
      getCoursesByTeachermessage:
          getCoursesByTeachermessage ?? this.getCoursesByTeachermessage,
      //
      addChapterState: addChapterState ?? this.addChapterState,
      addChapterMessage: addChapterMessage ?? this.addChapterMessage,
      addChapterSuccess: addChapterSuccess ?? this.addChapterSuccess,
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

        addCoruseState,
        addCourseMessage,
        addCourseSuccess,
        //
        getCoursesByTeacher,
        getCoursesByTeacherState,
        getCoursesByTeachermessage,

        addChapterState,
        addChapterMessage,
        addChapterSuccess,
        //
      ];
}
