import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/MainScreen/domaine/entities/course_detail_entity.dart';
import 'package:frontend/MainScreen/domaine/entities/suggested_courses.dart';
import 'package:frontend/MainScreen/domaine/usecases/get_course_detail.dart';
import 'package:frontend/MainScreen/domaine/usecases/get_suggested_courses.dart';
import 'package:frontend/cores/utils/enums.dart';

part 'course_event.dart';
part 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  final GetSuggestedCoursesUseCase getSuggestedCoursesUseCase;
  final GetCoursedDetailUseCase getCoursedDetailUseCase;
  CourseBloc(this.getCoursedDetailUseCase, this.getSuggestedCoursesUseCase)
      : super(const CourseState()) {
    on<GetSuggestedCoursesEvent>(_getSuggestedCoursesEvent);
    on<GetCourseDetailEvent>(_getCourseDetailEvent);
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
}
