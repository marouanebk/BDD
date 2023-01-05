# Diff Details

Date : 2023-01-05 15:44:03

Directory d:\\dev\\1CS Projects\\BDD\\frontend\\lib

Total : 55 files,  2979 codes, 267 comments, 221 blanks, all 3467 lines

[Summary](results.md) / [Details](details.md) / [Diff Summary](diff.md) / Diff Details

## Files
| filename | language | code | comment | blank | total |
| :--- | :--- | ---: | ---: | ---: | ---: |
| [lib/MainScreen/data/datasource/course_datasource.dart](/lib/MainScreen/data/datasource/course_datasource.dart) | Dart | 37 | 0 | 4 | 41 |
| [lib/MainScreen/data/model/course_detail_model.dart](/lib/MainScreen/data/model/course_detail_model.dart) | Dart | 11 | 20 | 7 | 38 |
| [lib/MainScreen/data/model/course_model.dart](/lib/MainScreen/data/model/course_model.dart) | Dart | 2 | 0 | 0 | 2 |
| [lib/MainScreen/data/repository/course_repo_implem.dart](/lib/MainScreen/data/repository/course_repo_implem.dart) | Dart | 27 | -1 | 2 | 28 |
| [lib/MainScreen/domaine/entities/course_content.dart](/lib/MainScreen/domaine/entities/course_content.dart) | Dart | 43 | 11 | 8 | 62 |
| [lib/MainScreen/domaine/entities/course_detail_entity.dart](/lib/MainScreen/domaine/entities/course_detail_entity.dart) | Dart | -1 | 0 | 0 | -1 |
| [lib/MainScreen/domaine/entities/suggested_courses.dart](/lib/MainScreen/domaine/entities/suggested_courses.dart) | Dart | 3 | 0 | 0 | 3 |
| [lib/MainScreen/domaine/repository/base_course_repo.dart](/lib/MainScreen/domaine/repository/base_course_repo.dart) | Dart | 4 | 0 | 1 | 5 |
| [lib/MainScreen/domaine/usecases/add_chapter_usecase.dart](/lib/MainScreen/domaine/usecases/add_chapter_usecase.dart) | Dart | -1 | 0 | 0 | -1 |
| [lib/MainScreen/domaine/usecases/search_courses_usecase.dart](/lib/MainScreen/domaine/usecases/search_courses_usecase.dart) | Dart | 11 | 0 | 4 | 15 |
| [lib/MainScreen/domaine/usecases/search_users_usecase.dart](/lib/MainScreen/domaine/usecases/search_users_usecase.dart) | Dart | 11 | 0 | 4 | 15 |
| [lib/MainScreen/presentation/controller/bloc/course_bloc.dart](/lib/MainScreen/presentation/controller/bloc/course_bloc.dart) | Dart | 44 | 0 | 0 | 44 |
| [lib/MainScreen/presentation/controller/bloc/course_event.dart](/lib/MainScreen/presentation/controller/bloc/course_event.dart) | Dart | 12 | 0 | 4 | 16 |
| [lib/MainScreen/presentation/controller/bloc/course_state.dart](/lib/MainScreen/presentation/controller/bloc/course_state.dart) | Dart | 30 | 9 | 0 | 39 |
| [lib/MainScreen/presentation/screens/base_screen.dart](/lib/MainScreen/presentation/screens/base_screen.dart) | Dart | 12 | 0 | 3 | 15 |
| [lib/MainScreen/presentation/screens/coursedetail.dart](/lib/MainScreen/presentation/screens/coursedetail.dart) | Dart | 18 | 9 | 2 | 29 |
| [lib/MainScreen/presentation/screens/mainpage.dart](/lib/MainScreen/presentation/screens/mainpage.dart) | Dart | 10 | 0 | 0 | 10 |
| [lib/MainScreen/presentation/screens/quizz.dart/quizz_page.dart](/lib/MainScreen/presentation/screens/quizz.dart/quizz_page.dart) | Dart | 447 | 45 | 9 | 501 |
| [lib/MainScreen/presentation/screens/search/search_screen.dart](/lib/MainScreen/presentation/screens/search/search_screen.dart) | Dart | 313 | 17 | 15 | 345 |
| [lib/MainScreen/presentation/screens/teacher/add_chapter.dart](/lib/MainScreen/presentation/screens/teacher/add_chapter.dart) | Dart | 761 | 35 | 31 | 827 |
| [lib/MainScreen/presentation/screens/teacher/new_course.dart](/lib/MainScreen/presentation/screens/teacher/new_course.dart) | Dart | 422 | 20 | 8 | 450 |
| [lib/MainScreen/presentation/screens/teacher/teacher_base_screen.dart](/lib/MainScreen/presentation/screens/teacher/teacher_base_screen.dart) | Dart | 14 | 0 | 3 | 17 |
| [lib/MainScreen/presentation/screens/teacher/teacher_courses.dart](/lib/MainScreen/presentation/screens/teacher/teacher_courses.dart) | Dart | 5 | 0 | -1 | 4 |
| [lib/MainScreen/presentation/screens/teacher_detail.dart](/lib/MainScreen/presentation/screens/teacher_detail.dart) | Dart | 0 | 0 | -1 | -1 |
| [lib/authentication/data/datasource/user_datasource.dart](/lib/authentication/data/datasource/user_datasource.dart) | Dart | -3 | 0 | 0 | -3 |
| [lib/authentication/data/models/user_model.dart](/lib/authentication/data/models/user_model.dart) | Dart | 1 | 0 | 0 | 1 |
| [lib/authentication/data/repository/user_repository_implem.dart](/lib/authentication/data/repository/user_repository_implem.dart) | Dart | -1 | 0 | 0 | -1 |
| [lib/authentication/domaine/entities/user_entitiy.dart](/lib/authentication/domaine/entities/user_entitiy.dart) | Dart | 3 | 0 | 0 | 3 |
| [lib/authentication/domaine/repository/user_repository.dart](/lib/authentication/domaine/repository/user_repository.dart) | Dart | 0 | 1 | 4 | 5 |
| [lib/authentication/domaine/usecases/get_user_detaills_usecase.dart](/lib/authentication/domaine/usecases/get_user_detaills_usecase.dart) | Dart | -1 | 0 | 0 | -1 |
| [lib/authentication/presentation/controller/authentication_bloc/authentication_state.dart](/lib/authentication/presentation/controller/authentication_bloc/authentication_state.dart) | Dart | -1 | 0 | 0 | -1 |
| [lib/chat/data/datasource/chat_datasource.dart](/lib/chat/data/datasource/chat_datasource.dart) | Dart | 104 | 4 | 14 | 122 |
| [lib/chat/data/model/conversation_model.dart](/lib/chat/data/model/conversation_model.dart) | Dart | 19 | 17 | 8 | 44 |
| [lib/chat/data/model/message_model.dart](/lib/chat/data/model/message_model.dart) | Dart | 25 | 3 | 7 | 35 |
| [lib/chat/data/repository/chat_repo_implem.dart](/lib/chat/data/repository/chat_repo_implem.dart) | Dart | 49 | 0 | 7 | 56 |
| [lib/chat/domaine/entities/conversation_entity.dart](/lib/chat/domaine/entities/conversation_entity.dart) | Dart | 17 | 1 | 4 | 22 |
| [lib/chat/domaine/entities/message_entity.dart](/lib/chat/domaine/entities/message_entity.dart) | Dart | 20 | 1 | 4 | 25 |
| [lib/chat/domaine/repository/base_chat_repo.dart](/lib/chat/domaine/repository/base_chat_repo.dart) | Dart | 11 | 4 | 5 | 20 |
| [lib/chat/domaine/usecases/add_conversation_usecase.dart](/lib/chat/domaine/usecases/add_conversation_usecase.dart) | Dart | 10 | 0 | 4 | 14 |
| [lib/chat/domaine/usecases/getAllCovnersationUseCase.dart](/lib/chat/domaine/usecases/getAllCovnersationUseCase.dart) | Dart | 11 | 0 | 4 | 15 |
| [lib/chat/domaine/usecases/get_messages_usecase.dart](/lib/chat/domaine/usecases/get_messages_usecase.dart) | Dart | 11 | 0 | 4 | 15 |
| [lib/chat/domaine/usecases/send_message_usecase.dart](/lib/chat/domaine/usecases/send_message_usecase.dart) | Dart | 11 | 0 | 4 | 15 |
| [lib/chat/presentation/controller/bloc/chat_bloc.dart](/lib/chat/presentation/controller/bloc/chat_bloc.dart) | Dart | 99 | 4 | 8 | 111 |
| [lib/chat/presentation/controller/bloc/chat_event.dart](/lib/chat/presentation/controller/bloc/chat_event.dart) | Dart | 25 | 0 | 10 | 35 |
| [lib/chat/presentation/controller/bloc/chat_state.dart](/lib/chat/presentation/controller/bloc/chat_state.dart) | Dart | 67 | 9 | 8 | 84 |
| [lib/chat/presentation/screens/all_chat_screen.dart](/lib/chat/presentation/screens/all_chat_screen.dart) | Dart | 28 | 1 | 4 | 33 |
| [lib/chat/presentation/screens/chat_screen.dart](/lib/chat/presentation/screens/chat_screen.dart) | Dart | 122 | 34 | 11 | 167 |
| [lib/chat/presentation/screens/message_class.dart](/lib/chat/presentation/screens/message_class.dart) | Dart | 10 | 0 | 1 | 11 |
| [lib/cores/network/api_constants.dart](/lib/cores/network/api_constants.dart) | Dart | 16 | 0 | 6 | 22 |
| [lib/cores/services/service_locator.dart](/lib/cores/services/service_locator.dart) | Dart | 20 | 1 | -1 | 20 |
| [lib/main.dart](/lib/main.dart) | Dart | -2 | -1 | 0 | -3 |
| [lib/profile/presentation/screens/profile_screen.dart](/lib/profile/presentation/screens/profile_screen.dart) | Dart | 81 | 21 | 4 | 106 |
| [lib/profile/presentation/screens/student_courses.dart](/lib/profile/presentation/screens/student_courses.dart) | Dart | -2 | 0 | -1 | -3 |
| [lib/to-dos/data/datasource/todo_datasource.dart](/lib/to-dos/data/datasource/todo_datasource.dart) | Dart | -5 | 2 | -1 | -4 |
| [lib/to-dos/presentation/screens/todos.dart](/lib/to-dos/presentation/screens/todos.dart) | Dart | -1 | 0 | 0 | -1 |

[Summary](results.md) / [Details](details.md) / [Diff Summary](diff.md) / Diff Details