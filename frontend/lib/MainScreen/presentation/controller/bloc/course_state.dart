part of 'course_bloc.dart';

class CourseState extends Equatable {
  final List<Course> getSuggestedCourses;
  final RequestState getSuggestedCoursesState;
  final String getSuggestedCoursesmessage;

  //
  final CourseDetails? getCourseDetail;
  final RequestState getCourseDetailState;
  final String getCourseDetailmessage;

  final RequestState addcourseState;
  final String addCourseMessage;
  final bool addCourseSuccess;

  final RequestState addChapterState;
  final String addChapterMessage;
  final bool addChapterSuccess;

  final List<Course> getCoursesByTeacher;
  final RequestState getCoursesByTeacherState;
  final String getCoursesByTeachermessage;
  //
  final List<CourseModel> searchCourses;
  final RequestState searchCoursesState;
  final String searchCoursesmessage;
  //
  final List<UserModel> searchUsers;
  final RequestState searchUsersState;
  final String searchUsersmessage;

  const CourseState({
    this.getSuggestedCourses = const [],
    this.getSuggestedCoursesState = RequestState.loading,
    this.getSuggestedCoursesmessage = "",
    //
    this.getCourseDetail,
    this.getCourseDetailState = RequestState.loading,
    this.getCourseDetailmessage = "",
    //
    this.addcourseState = RequestState.loading,
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
    //
    this.searchCourses = const [],
    this.searchCoursesState = RequestState.loading,
    this.searchCoursesmessage = "",
    //
    this.searchUsers = const [],
    this.searchUsersState = RequestState.loading,
    this.searchUsersmessage = "",
  });

  CourseState copyWith({
    List<Course>? getSuggestedCourses,
    RequestState? getSuggestedCoursesState,
    String? getSuggestedCoursesmessage,
    //
    CourseDetails? getCourseDetail,
    RequestState? getCourseDetailState,
    String? getCourseDetailmessage,
    RequestState? addcourseState,
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
    List<CourseModel>? searchCourses,
    RequestState? searchCoursesState,
    String? searchCoursesmessage,
    //
    List<UserModel>? searchUsers,
    RequestState? searchUsersState,
    String? searchUsersmessage,

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
      addcourseState: addcourseState ?? this.addcourseState,
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
      //
      searchCourses: searchCourses ?? this.searchCourses,
      searchCoursesState: searchCoursesState ?? this.searchCoursesState,
      searchCoursesmessage: searchCoursesmessage ?? this.searchCoursesmessage,
      //
      searchUsers: searchUsers ?? this.searchUsers,
      searchUsersState: searchUsersState ?? this.searchUsersState,
      searchUsersmessage: searchUsersmessage ?? this.searchUsersmessage,
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

        addcourseState,
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
        searchCourses,
        searchCoursesState,
        searchCoursesmessage,
        //
        searchUsers,
        searchUsersState,
        searchUsersmessage,
      ];
}
