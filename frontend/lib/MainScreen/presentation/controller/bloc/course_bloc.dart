import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/MainScreen/domaine/entities/course_detail_entity.dart';
import 'package:frontend/MainScreen/domaine/entities/suggested_courses.dart';
import 'package:frontend/MainScreen/domaine/usecases/add_course_usecase.dart';
import 'package:frontend/MainScreen/domaine/usecases/get_course_detail.dart';
import 'package:frontend/MainScreen/domaine/usecases/get_suggested_courses.dart';
import 'package:frontend/cores/utils/enums.dart';

part 'course_event.dart';
part 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  final GetSuggestedCoursesUseCase getSuggestedCoursesUseCase;
  final GetCoursedDetailUseCase getCoursedDetailUseCase;
  final AddCourseUseCase addCourseUseCase;
  CourseBloc(this.getCoursedDetailUseCase, this.getSuggestedCoursesUseCase,
      this.addCourseUseCase)
      : super(const CourseState()) {
    on<GetSuggestedCoursesEvent>(_getSuggestedCoursesEvent);
    on<GetCourseDetailEvent>(_getCourseDetailEvent);
    on<AddCourseEvent>(_addCourseEvent);
  }

  FutureOr<void> _getSuggestedCoursesEvent(
      GetSuggestedCoursesEvent event, Emitter<CourseState> emit) async {
    log("in suggested courses event ");

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
    log("in add event  courses event ");

    final result = await addCourseUseCase(event.courseDetails);
    result.fold(
      (l) => emit(
        state.copyWith(
          addCoruseState: RequestState.error,
          addCourseMessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          addCoruseState: RequestState.loaded,
        ),
      ),
    );
  }
}
