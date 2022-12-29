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
    on<CourseEvent>((event, emit) {});
  }
}
