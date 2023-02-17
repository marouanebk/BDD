# Details

Date : 2023-01-22 23:25:56

Directory d:\\dev\\1CS Projects\\BDD\\frontend\\lib

Total : 97 files,  10596 codes, 512 comments, 825 blanks, all 11933 lines

[Summary](results.md) / Details / [Diff Summary](diff.md) / [Diff Details](diff-details.md)

## Files
| filename | language | code | comment | blank | total |
| :--- | :--- | ---: | ---: | ---: | ---: |
| [lib/MainScreen/data/datasource/course_datasource.dart](/lib/MainScreen/data/datasource/course_datasource.dart) | Dart | 189 | 6 | 21 | 216 |
| [lib/MainScreen/data/model/course_detail_model.dart](/lib/MainScreen/data/model/course_detail_model.dart) | Dart | 58 | 24 | 13 | 95 |
| [lib/MainScreen/data/model/course_model.dart](/lib/MainScreen/data/model/course_model.dart) | Dart | 24 | 7 | 4 | 35 |
| [lib/MainScreen/data/repository/course_repo_implem.dart](/lib/MainScreen/data/repository/course_repo_implem.dart) | Dart | 104 | 0 | 12 | 116 |
| [lib/MainScreen/domaine/entities/course_content.dart](/lib/MainScreen/domaine/entities/course_content.dart) | Dart | 66 | 12 | 14 | 92 |
| [lib/MainScreen/domaine/entities/course_detail_entity.dart](/lib/MainScreen/domaine/entities/course_detail_entity.dart) | Dart | 29 | 4 | 5 | 38 |
| [lib/MainScreen/domaine/entities/suggested_courses.dart](/lib/MainScreen/domaine/entities/suggested_courses.dart) | Dart | 23 | 1 | 4 | 28 |
| [lib/MainScreen/domaine/repository/base_course_repo.dart](/lib/MainScreen/domaine/repository/base_course_repo.dart) | Dart | 19 | 0 | 6 | 25 |
| [lib/MainScreen/domaine/usecases/add_chapter_usecase.dart](/lib/MainScreen/domaine/usecases/add_chapter_usecase.dart) | Dart | 12 | 0 | 4 | 16 |
| [lib/MainScreen/domaine/usecases/add_course_usecase.dart](/lib/MainScreen/domaine/usecases/add_course_usecase.dart) | Dart | 11 | 0 | 4 | 15 |
| [lib/MainScreen/domaine/usecases/enroll_course_usecase.dart](/lib/MainScreen/domaine/usecases/enroll_course_usecase.dart) | Dart | 10 | 0 | 4 | 14 |
| [lib/MainScreen/domaine/usecases/get_course_detail.dart](/lib/MainScreen/domaine/usecases/get_course_detail.dart) | Dart | 11 | 0 | 4 | 15 |
| [lib/MainScreen/domaine/usecases/get_courses_by_teacher.dart](/lib/MainScreen/domaine/usecases/get_courses_by_teacher.dart) | Dart | 11 | 0 | 4 | 15 |
| [lib/MainScreen/domaine/usecases/get_enrolled_courses.dart](/lib/MainScreen/domaine/usecases/get_enrolled_courses.dart) | Dart | 11 | 0 | 4 | 15 |
| [lib/MainScreen/domaine/usecases/get_suggested_courses.dart](/lib/MainScreen/domaine/usecases/get_suggested_courses.dart) | Dart | 11 | 0 | 4 | 15 |
| [lib/MainScreen/domaine/usecases/search_courses_usecase.dart](/lib/MainScreen/domaine/usecases/search_courses_usecase.dart) | Dart | 11 | 0 | 4 | 15 |
| [lib/MainScreen/domaine/usecases/search_users_usecase.dart](/lib/MainScreen/domaine/usecases/search_users_usecase.dart) | Dart | 11 | 0 | 4 | 15 |
| [lib/MainScreen/presentation/component/add_course_success.dart](/lib/MainScreen/presentation/component/add_course_success.dart) | Dart | 77 | 1 | 3 | 81 |
| [lib/MainScreen/presentation/controller/bloc/course_bloc.dart](/lib/MainScreen/presentation/controller/bloc/course_bloc.dart) | Dart | 206 | 14 | 15 | 235 |
| [lib/MainScreen/presentation/controller/bloc/course_event.dart](/lib/MainScreen/presentation/controller/bloc/course_event.dart) | Dart | 51 | 0 | 19 | 70 |
| [lib/MainScreen/presentation/controller/bloc/course_state.dart](/lib/MainScreen/presentation/controller/bloc/course_state.dart) | Dart | 140 | 30 | 17 | 187 |
| [lib/MainScreen/presentation/screens/base_screen.dart](/lib/MainScreen/presentation/screens/base_screen.dart) | Dart | 106 | 15 | 9 | 130 |
| [lib/MainScreen/presentation/screens/coursedetail.dart](/lib/MainScreen/presentation/screens/coursedetail.dart) | Dart | 429 | 10 | 15 | 454 |
| [lib/MainScreen/presentation/screens/mainpage.dart](/lib/MainScreen/presentation/screens/mainpage.dart) | Dart | 576 | 1 | 20 | 597 |
| [lib/MainScreen/presentation/screens/pdf_preview.dart](/lib/MainScreen/presentation/screens/pdf_preview.dart) | Dart | 20 | 0 | 4 | 24 |
| [lib/MainScreen/presentation/screens/quizz.dart/quizz_page.dart](/lib/MainScreen/presentation/screens/quizz.dart/quizz_page.dart) | Dart | 446 | 45 | 10 | 501 |
| [lib/MainScreen/presentation/screens/search/search_screen.dart](/lib/MainScreen/presentation/screens/search/search_screen.dart) | Dart | 313 | 17 | 15 | 345 |
| [lib/MainScreen/presentation/screens/teacher/add_chapter.dart](/lib/MainScreen/presentation/screens/teacher/add_chapter.dart) | Dart | 761 | 35 | 31 | 827 |
| [lib/MainScreen/presentation/screens/teacher/new_course.dart](/lib/MainScreen/presentation/screens/teacher/new_course.dart) | Dart | 885 | 26 | 29 | 940 |
| [lib/MainScreen/presentation/screens/teacher/teacher_base_screen.dart](/lib/MainScreen/presentation/screens/teacher/teacher_base_screen.dart) | Dart | 97 | 15 | 10 | 122 |
| [lib/MainScreen/presentation/screens/teacher/teacher_courses.dart](/lib/MainScreen/presentation/screens/teacher/teacher_courses.dart) | Dart | 225 | 23 | 10 | 258 |
| [lib/MainScreen/presentation/screens/teacher_detail.dart](/lib/MainScreen/presentation/screens/teacher_detail.dart) | Dart | 262 | 1 | 9 | 272 |
| [lib/authentication/data/datasource/user_datasource.dart](/lib/authentication/data/datasource/user_datasource.dart) | Dart | 184 | 1 | 24 | 209 |
| [lib/authentication/data/models/user_model.dart](/lib/authentication/data/models/user_model.dart) | Dart | 34 | 0 | 4 | 38 |
| [lib/authentication/data/repository/user_repository_implem.dart](/lib/authentication/data/repository/user_repository_implem.dart) | Dart | 75 | 0 | 14 | 89 |
| [lib/authentication/domaine/entities/user_entitiy.dart](/lib/authentication/domaine/entities/user_entitiy.dart) | Dart | 19 | 0 | 4 | 23 |
| [lib/authentication/domaine/repository/user_repository.dart](/lib/authentication/domaine/repository/user_repository.dart) | Dart | 12 | 1 | 14 | 27 |
| [lib/authentication/domaine/usecases/choose_type_usecase.dart](/lib/authentication/domaine/usecases/choose_type_usecase.dart) | Dart | 10 | 0 | 4 | 14 |
| [lib/authentication/domaine/usecases/get_user_detaills_usecase.dart](/lib/authentication/domaine/usecases/get_user_detaills_usecase.dart) | Dart | 11 | 0 | 4 | 15 |
| [lib/authentication/domaine/usecases/login_usecase.dart](/lib/authentication/domaine/usecases/login_usecase.dart) | Dart | 11 | 0 | 4 | 15 |
| [lib/authentication/domaine/usecases/logout_usecase.dart](/lib/authentication/domaine/usecases/logout_usecase.dart) | Dart | 10 | 0 | 5 | 15 |
| [lib/authentication/domaine/usecases/set_biography_usecase.dart](/lib/authentication/domaine/usecases/set_biography_usecase.dart) | Dart | 10 | 0 | 4 | 14 |
| [lib/authentication/domaine/usecases/signup_usecase.dart](/lib/authentication/domaine/usecases/signup_usecase.dart) | Dart | 11 | 0 | 5 | 16 |
| [lib/authentication/presentation/controller/authentication_bloc/authentication_bloc.dart](/lib/authentication/presentation/controller/authentication_bloc/authentication_bloc.dart) | Dart | 139 | 0 | 11 | 150 |
| [lib/authentication/presentation/controller/authentication_bloc/authentication_event.dart](/lib/authentication/presentation/controller/authentication_bloc/authentication_event.dart) | Dart | 42 | 0 | 18 | 60 |
| [lib/authentication/presentation/controller/authentication_bloc/authentication_state.dart](/lib/authentication/presentation/controller/authentication_bloc/authentication_state.dart) | Dart | 40 | 0 | 19 | 59 |
| [lib/authentication/presentation/screens/choise.dart](/lib/authentication/presentation/screens/choise.dart) | Dart | 215 | 0 | 5 | 220 |
| [lib/authentication/presentation/screens/login_page.dart](/lib/authentication/presentation/screens/login_page.dart) | Dart | 359 | 7 | 14 | 380 |
| [lib/authentication/presentation/screens/register_page.dart](/lib/authentication/presentation/screens/register_page.dart) | Dart | 328 | 1 | 16 | 345 |
| [lib/chat/data/datasource/chat_datasource.dart](/lib/chat/data/datasource/chat_datasource.dart) | Dart | 102 | 4 | 12 | 118 |
| [lib/chat/data/model/conversation_model.dart](/lib/chat/data/model/conversation_model.dart) | Dart | 19 | 17 | 8 | 44 |
| [lib/chat/data/model/message_model.dart](/lib/chat/data/model/message_model.dart) | Dart | 32 | 3 | 7 | 42 |
| [lib/chat/data/repository/chat_repo_implem.dart](/lib/chat/data/repository/chat_repo_implem.dart) | Dart | 49 | 0 | 7 | 56 |
| [lib/chat/domaine/entities/conversation_entity.dart](/lib/chat/domaine/entities/conversation_entity.dart) | Dart | 17 | 1 | 4 | 22 |
| [lib/chat/domaine/entities/message_entity.dart](/lib/chat/domaine/entities/message_entity.dart) | Dart | 23 | 1 | 3 | 27 |
| [lib/chat/domaine/repository/base_chat_repo.dart](/lib/chat/domaine/repository/base_chat_repo.dart) | Dart | 11 | 4 | 5 | 20 |
| [lib/chat/domaine/usecases/add_conversation_usecase.dart](/lib/chat/domaine/usecases/add_conversation_usecase.dart) | Dart | 10 | 0 | 4 | 14 |
| [lib/chat/domaine/usecases/getAllCovnersationUseCase.dart](/lib/chat/domaine/usecases/getAllCovnersationUseCase.dart) | Dart | 11 | 0 | 4 | 15 |
| [lib/chat/domaine/usecases/get_messages_usecase.dart](/lib/chat/domaine/usecases/get_messages_usecase.dart) | Dart | 11 | 0 | 4 | 15 |
| [lib/chat/domaine/usecases/send_message_usecase.dart](/lib/chat/domaine/usecases/send_message_usecase.dart) | Dart | 11 | 0 | 4 | 15 |
| [lib/chat/presentation/controller/bloc/chat_bloc.dart](/lib/chat/presentation/controller/bloc/chat_bloc.dart) | Dart | 99 | 4 | 8 | 111 |
| [lib/chat/presentation/controller/bloc/chat_event.dart](/lib/chat/presentation/controller/bloc/chat_event.dart) | Dart | 25 | 0 | 10 | 35 |
| [lib/chat/presentation/controller/bloc/chat_state.dart](/lib/chat/presentation/controller/bloc/chat_state.dart) | Dart | 67 | 9 | 8 | 84 |
| [lib/chat/presentation/screens/all_chat_screen.dart](/lib/chat/presentation/screens/all_chat_screen.dart) | Dart | 216 | 11 | 11 | 238 |
| [lib/chat/presentation/screens/chat_screen.dart](/lib/chat/presentation/screens/chat_screen.dart) | Dart | 174 | 46 | 23 | 243 |
| [lib/chat/presentation/screens/message_class.dart](/lib/chat/presentation/screens/message_class.dart) | Dart | 10 | 0 | 1 | 11 |
| [lib/cores/const/colors.dart](/lib/cores/const/colors.dart) | Dart | 7 | 0 | 1 | 8 |
| [lib/cores/const/const.dart](/lib/cores/const/const.dart) | Dart | 3 | 0 | 0 | 3 |
| [lib/cores/error/exceptions.dart](/lib/cores/error/exceptions.dart) | Dart | 9 | 1 | 8 | 18 |
| [lib/cores/error/failure.dart](/lib/cores/error/failure.dart) | Dart | 13 | 0 | 7 | 20 |
| [lib/cores/network/api_constants.dart](/lib/cores/network/api_constants.dart) | Dart | 16 | 0 | 6 | 22 |
| [lib/cores/network/error_message_model.dart](/lib/cores/network/error_message_model.dart) | Dart | 17 | 0 | 4 | 21 |
| [lib/cores/services/service_locator.dart](/lib/cores/services/service_locator.dart) | Dart | 88 | 12 | 11 | 111 |
| [lib/cores/utils/enums.dart](/lib/cores/utils/enums.dart) | Dart | 5 | 0 | 0 | 5 |
| [lib/cores/widgets/text_input_field.dart](/lib/cores/widgets/text_input_field.dart) | Dart | 45 | 1 | 4 | 50 |
| [lib/main.dart](/lib/main.dart) | Dart | 34 | 0 | 5 | 39 |
| [lib/notifications/presentation/screens/notifications.dart](/lib/notifications/presentation/screens/notifications.dart) | Dart | 69 | 0 | 6 | 75 |
| [lib/profile/presentation/component/bio_success_page.dart](/lib/profile/presentation/component/bio_success_page.dart) | Dart | 77 | 1 | 3 | 81 |
| [lib/profile/presentation/component/biography_page.dart](/lib/profile/presentation/component/biography_page.dart) | Dart | 138 | 5 | 6 | 149 |
| [lib/profile/presentation/component/stats_page.dart](/lib/profile/presentation/component/stats_page.dart) | Dart | 260 | 2 | 10 | 272 |
| [lib/profile/presentation/screens/edit_profile.dart](/lib/profile/presentation/screens/edit_profile.dart) | Dart | 137 | 0 | 4 | 141 |
| [lib/profile/presentation/screens/profile_screen.dart](/lib/profile/presentation/screens/profile_screen.dart) | Dart | 444 | 27 | 18 | 489 |
| [lib/profile/presentation/screens/student_courses.dart](/lib/profile/presentation/screens/student_courses.dart) | Dart | 14 | 0 | 3 | 17 |
| [lib/to-dos/data/datasource/todo_datasource.dart](/lib/to-dos/data/datasource/todo_datasource.dart) | Dart | 87 | 2 | 10 | 99 |
| [lib/to-dos/data/model/todo_model.dart](/lib/to-dos/data/model/todo_model.dart) | Dart | 24 | 0 | 4 | 28 |
| [lib/to-dos/data/repository/todo_repo_emplem.dart](/lib/to-dos/data/repository/todo_repo_emplem.dart) | Dart | 61 | 0 | 8 | 69 |
| [lib/to-dos/domaine/entities/to_do_entity.dart](/lib/to-dos/domaine/entities/to_do_entity.dart) | Dart | 15 | 1 | 4 | 20 |
| [lib/to-dos/domaine/repository/base_todo_repo.dart](/lib/to-dos/domaine/repository/base_todo_repo.dart) | Dart | 10 | 0 | 3 | 13 |
| [lib/to-dos/domaine/usecases/add_todo_usecase.dart](/lib/to-dos/domaine/usecases/add_todo_usecase.dart) | Dart | 11 | 0 | 4 | 15 |
| [lib/to-dos/domaine/usecases/delete_todo_usecase.dart](/lib/to-dos/domaine/usecases/delete_todo_usecase.dart) | Dart | 11 | 0 | 4 | 15 |
| [lib/to-dos/domaine/usecases/edit_todo_usecase.dart](/lib/to-dos/domaine/usecases/edit_todo_usecase.dart) | Dart | 11 | 0 | 4 | 15 |
| [lib/to-dos/domaine/usecases/get_done_todo_usecase.dart](/lib/to-dos/domaine/usecases/get_done_todo_usecase.dart) | Dart | 11 | 0 | 4 | 15 |
| [lib/to-dos/domaine/usecases/get_undone_todo_usecase.dart](/lib/to-dos/domaine/usecases/get_undone_todo_usecase.dart) | Dart | 11 | 0 | 4 | 15 |
| [lib/to-dos/presentation/controller/todo_bloc/todo_bloc.dart](/lib/to-dos/presentation/controller/todo_bloc/todo_bloc.dart) | Dart | 74 | 0 | 7 | 81 |
| [lib/to-dos/presentation/controller/todo_bloc/todo_event.dart](/lib/to-dos/presentation/controller/todo_bloc/todo_event.dart) | Dart | 17 | 0 | 9 | 26 |
| [lib/to-dos/presentation/controller/todo_bloc/todo_state.dart](/lib/to-dos/presentation/controller/todo_bloc/todo_state.dart) | Dart | 55 | 11 | 7 | 73 |
| [lib/to-dos/presentation/screens/todos.dart](/lib/to-dos/presentation/screens/todos.dart) | Dart | 1,220 | 52 | 34 | 1,306 |

[Summary](results.md) / Details / [Diff Summary](diff.md) / [Diff Details](diff-details.md)