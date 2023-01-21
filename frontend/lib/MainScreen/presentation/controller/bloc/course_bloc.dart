import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/MainScreen/data/model/course_model.dart';
import 'package:frontend/MainScreen/domaine/entities/course_content.dart';
import 'package:frontend/MainScreen/domaine/entities/course_detail_entity.dart';
import 'package:frontend/MainScreen/domaine/entities/suggested_courses.dart';
import 'package:frontend/MainScreen/domaine/usecases/add_chapter_usecase.dart';
import 'package:frontend/MainScreen/domaine/usecases/add_course_usecase.dart';
import 'package:frontend/MainScreen/domaine/usecases/enroll_course_usecase.dart';
import 'package:frontend/MainScreen/domaine/usecases/get_course_detail.dart';
import 'package:frontend/MainScreen/domaine/usecases/get_courses_by_teacher.dart';
import 'package:frontend/MainScreen/domaine/usecases/get_enrolled_courses.dart';
import 'package:frontend/MainScreen/domaine/usecases/get_suggested_courses.dart';
import 'package:frontend/MainScreen/domaine/usecases/search_courses_usecase.dart';
import 'package:frontend/MainScreen/domaine/usecases/search_users_usecase.dart';
import 'package:frontend/authentication/data/models/user_model.dart';
import 'package:frontend/cores/utils/enums.dart';

part 'course_event.dart';
part 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  final GetSuggestedCoursesUseCase getSuggestedCoursesUseCase;
  final GetCoursedDetailUseCase getCoursedDetailUseCase;
  final AddCourseUseCase addCourseUseCase;
  final GetCoursesByTeacherUseCase getCoursesByTeacherUseCase;
  final AddChapterUseCase addChapterUseCase;
  final SearchCoursesUseCase searchCoursesUseCase;
  final SearchUsersUsecase searchUsersUsecase;
  final GetEnrolledCoursesUseCase getEnrolledCoursesUseCase;
  final EnrollCourseUseCase enrollCourseUseCase;
  CourseBloc(
    this.getCoursedDetailUseCase,
    this.getSuggestedCoursesUseCase,
    this.addCourseUseCase,
    this.getCoursesByTeacherUseCase,
    this.addChapterUseCase,
    this.searchCoursesUseCase,
    this.searchUsersUsecase,
    this.getEnrolledCoursesUseCase,
    this.enrollCourseUseCase,
  ) : super(const CourseState()) {
    on<GetSuggestedCoursesEvent>(_getSuggestedCoursesEvent);
    on<GetCourseDetailEvent>(_getCourseDetailEvent);
    on<AddCourseEvent>(_addCourseEvent);
    on<GetCoursesByTeacherEvent>(_getCoursesByTeacherEvent);
    on<AddChapterEvent>(_addChapterEvent);
    on<SearchCoursesEvent>(_seachCoursesEvent);
    on<SearchUsersEvent>(_seachUsersEvent);
    on<GetEnrolledCoursesEvenet>(_getEnrolledCoursesEvent);
    on<EnrollCourseEvent>(_enrollCourseEvent);
  }

  FutureOr<void> _getSuggestedCoursesEvent(
      GetSuggestedCoursesEvent event, Emitter<CourseState> emit) async {
    final result = await getSuggestedCoursesUseCase();
    result.fold(
      (l) => emit(
        state.copyWith(
          getSuggestedCoursesState: RequestState.error,
          getSuggestedCoursesmessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          getSuggestedCourses: r,
          getSuggestedCoursesState: RequestState.loaded,
        ),
      ),
    );
  }

  FutureOr<void> _enrollCourseEvent(
      EnrollCourseEvent event, Emitter<CourseState> emit) async {
    final result = await enrollCourseUseCase(event.id);
    log(result.toString());
    // result.fold(
    //   (l) => emit(
    //     state.copyWith(
    //       getSuggestedCoursesState: RequestState.error,
    //       getSuggestedCoursesmessage: l.message,
    //     ),
    //   ),
    //   (r) => emit(
    //     state.copyWith(
    //       getSuggestedCourses: r,
    //       getSuggestedCoursesState: RequestState.loaded,
    //     ),
    //   ),
    // );
  }

  FutureOr<void> _getEnrolledCoursesEvent(
      GetEnrolledCoursesEvenet event, Emitter<CourseState> emit) async {
    final result = await getEnrolledCoursesUseCase();
    log("result ");
    log(result.toString());
    result.fold(
      (l) => emit(
        state.copyWith(
          getEnrolledCoursesState: RequestState.error,
          getEnrolledCoursesmessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          getEnrolledCourses: r,
          getEnrolledCoursesState: RequestState.loaded,
        ),
      ),
    );
  }

  FutureOr<void> _seachCoursesEvent(
      SearchCoursesEvent event, Emitter<CourseState> emit) async {
    final result = await searchCoursesUseCase(event.key);
    result.fold(
      (l) => emit(
        state.copyWith(
          searchCoursesState: RequestState.error,
          searchCoursesmessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          searchCourses: r,
          searchCoursesState: RequestState.loaded,
        ),
      ),
    );
  }

  FutureOr<void> _seachUsersEvent(
      SearchUsersEvent event, Emitter<CourseState> emit) async {
    final result = await searchUsersUsecase(event.key);
    result.fold(
      (l) => emit(
        state.copyWith(
          searchUsersState: RequestState.error,
          searchUsersmessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          searchUsers: r,
          searchUsersState: RequestState.loaded,
        ),
      ),
    );
  }

  FutureOr<void> _getCoursesByTeacherEvent(
      GetCoursesByTeacherEvent event, Emitter<CourseState> emit) async {
    final result = await getCoursesByTeacherUseCase(event.id);
    result.fold(
      (l) => emit(
        state.copyWith(
          getCoursesByTeacherState: RequestState.error,
          getCoursesByTeachermessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          getCoursesByTeacher: r,
          getCoursesByTeacherState: RequestState.loaded,
        ),
      ),
    );
  }

  FutureOr<void> _getCourseDetailEvent(
      GetCourseDetailEvent event, Emitter<CourseState> emit) async {
    log("in suggested courses event ");

    final result = await getCoursedDetailUseCase(event.id);
    result.fold(
      (l) => emit(
        state.copyWith(
          getCourseDetailState: RequestState.error,
          getCourseDetailmessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          getCourseDetail: r,
          getCourseDetailState: RequestState.loaded,
        ),
      ),
    );
  }

  FutureOr<void> _addCourseEvent(
      AddCourseEvent event, Emitter<CourseState> emit) async {
    final result = await addCourseUseCase(event.courseDetails);
    result.fold(
      (l) => emit(
        state.copyWith(
          addcourseState: RequestState.error,
          addCourseMessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          addCourseSuccess: true,
          addcourseState: RequestState.loaded,
        ),
      ),
    );
  }

  FutureOr<void> _addChapterEvent(
      AddChapterEvent event, Emitter<CourseState> emit) async {
    log("in add chapter event ");

    final result = await addChapterUseCase(event.id, event.courseContent);
    result.fold(
      (l) => emit(
        state.copyWith(
          addChapterState: RequestState.error,
          addChapterMessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          addChapterSuccess: true,
          addChapterState: RequestState.loaded,
        ),
      ),
    );
  }
}
