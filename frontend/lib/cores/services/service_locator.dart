import 'package:frontend/MainScreen/data/datasource/course_datasource.dart';
import 'package:frontend/MainScreen/data/repository/course_repo_implem.dart';
import 'package:frontend/MainScreen/domaine/repository/base_course_repo.dart';
import 'package:frontend/MainScreen/domaine/usecases/add_chapter_usecase.dart';
import 'package:frontend/MainScreen/domaine/usecases/add_course_usecase.dart';
import 'package:frontend/MainScreen/domaine/usecases/get_course_detail.dart';
import 'package:frontend/MainScreen/domaine/usecases/get_courses_by_teacher.dart';
import 'package:frontend/MainScreen/domaine/usecases/get_suggested_courses.dart';
import 'package:frontend/MainScreen/presentation/controller/bloc/course_bloc.dart';
import 'package:frontend/authentication/data/datasource/user_datasource.dart';
import 'package:frontend/authentication/data/repository/user_repository_implem.dart';
import 'package:frontend/authentication/domaine/repository/user_repository.dart';
import 'package:frontend/authentication/domaine/usecases/choose_type_usecase.dart';
import 'package:frontend/authentication/domaine/usecases/get_user_detaills_usecase.dart';
import 'package:frontend/authentication/domaine/usecases/login_usecase.dart';
import 'package:frontend/authentication/domaine/usecases/logout_usecase.dart';
import 'package:frontend/authentication/domaine/usecases/set_biography_usecase.dart';
import 'package:frontend/authentication/domaine/usecases/signup_usecase.dart';
import 'package:frontend/authentication/presentation/controller/authentication_bloc/authentication_bloc.dart';
import 'package:frontend/chat/data/datasource/chat_datasource.dart';
import 'package:frontend/chat/data/repository/chat_repo_implem.dart';
import 'package:frontend/chat/domaine/repository/base_chat_repo.dart';
import 'package:frontend/chat/domaine/usecases/add_conversation_usecase.dart';
import 'package:frontend/chat/domaine/usecases/getAllCovnersationUseCase.dart';
import 'package:frontend/chat/domaine/usecases/get_messages_usecase.dart';
import 'package:frontend/chat/presentation/controller/bloc/chat_bloc.dart';
import 'package:frontend/to-dos/data/datasource/todo_datasource.dart';
import 'package:frontend/to-dos/data/repository/todo_repo_emplem.dart';
import 'package:frontend/to-dos/domaine/repository/base_todo_repo.dart';
import 'package:frontend/to-dos/domaine/usecases/add_todo_usecase.dart';
import 'package:frontend/to-dos/domaine/usecases/delete_todo_usecase.dart';
import 'package:frontend/to-dos/domaine/usecases/edit_todo_usecase.dart';
import 'package:frontend/to-dos/domaine/usecases/get_done_todo_usecase.dart';
import 'package:frontend/to-dos/domaine/usecases/get_undone_todo_usecase.dart';
import 'package:frontend/to-dos/presentation/controller/todo_bloc/todo_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class ServiceLocator {
  Future<void> init() async {
    // Bloc
    sl.registerFactory(() => UserBloc(sl(), sl(), sl(), sl(), sl(), sl()));
    sl.registerFactory(() => TodoBloc(sl(), sl(), sl(), sl(), sl()));
    sl.registerFactory(() => CourseBloc(sl(), sl(), sl(), sl(), sl()));
    sl.registerFactory(() => ChatBloc(sl(), sl(), sl()));

    // sl.registerFactory(() => UserBloc(
    // createUserUseCase: sl(), loginUserCase: sl()));
    // authentciation Usecases
    sl.registerLazySingleton(() => LoginUseCase(sl()));
    sl.registerLazySingleton(() => CreateUserUseCase(sl()));
    sl.registerLazySingleton(() => LogOutUseCase(sl()));
    sl.registerLazySingleton(() => ChooseTypeUseCase(sl()));
    sl.registerLazySingleton(() => SetBiographyUseCase(sl()));

    //todo usecases
    sl.registerLazySingleton(() => GetDoneTodoUseCase(sl()));
    sl.registerLazySingleton(() => GetUnDoneTodoUseCase(sl()));
    sl.registerLazySingleton(() => AddTodoUseCase(sl()));
    sl.registerLazySingleton(() => EditTodoUseCase(sl()));
    sl.registerLazySingleton(() => DeleteTodoUseCase(sl()));

    //chat
    sl.registerLazySingleton(() => AddConversationUseCase(sl()));
    sl.registerLazySingleton(() => GetAllConversationsUseCase(sl()));
    sl.registerLazySingleton(() => GetConversationMessagesUseCase(sl()));

    

    //courses usecases
    sl.registerLazySingleton(() => GetCoursedDetailUseCase(sl()));
    sl.registerLazySingleton(() => GetSuggestedCoursesUseCase(sl()));
    sl.registerLazySingleton(() => AddCourseUseCase(sl()));
    sl.registerLazySingleton(() => GetCoursesByTeacherUseCase(sl()));
    sl.registerLazySingleton(() => GetUserDetailsUseCase(sl()));
    sl.registerLazySingleton(() => AddChapterUseCase(sl()));

    // Repository
    sl.registerLazySingleton<BaseUserRepository>(() => UserRepository(sl()));
    sl.registerLazySingleton<BaseToDoRepository>(() => TodoRepository(sl()));
    sl.registerLazySingleton<BaseCourseRepository>(
        () => CourseRepository(sl()));
    sl.registerLazySingleton<BaseChatRepository>(() => ChatRepository(sl()));

    // sl.registerLazySingleton<BaseUserRepository>(() => UserRepository(sl()));

    // Datasources

    //todo
    sl.registerLazySingleton<BaseTodoRemoteDateSource>(
        () => TodoRemoteDataSource());
    //authentication
    sl.registerLazySingleton<BaseUserRemoteDateSource>(
        () => UserRemoteDataSource());
    sl.registerLazySingleton<BaseCourseRemoteDataSource>(
        () => CourseRemoteDataSource());
    sl.registerLazySingleton<BaseChatRemoteDataSource>(
        () => ChatRemoteDataSource());
  }
}
