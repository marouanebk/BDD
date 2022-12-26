import 'package:frontend/authentication/data/datasource/user_datasource.dart';
import 'package:frontend/authentication/data/repository/user_repository_implem.dart';
import 'package:frontend/authentication/domaine/repository/user_repository.dart';
import 'package:frontend/authentication/domaine/usecases/choose_type_usecase.dart';
import 'package:frontend/authentication/domaine/usecases/login_usecase.dart';
import 'package:frontend/authentication/domaine/usecases/logout_usecase.dart';
import 'package:frontend/authentication/domaine/usecases/signup_usecase.dart';
import 'package:frontend/authentication/presentation/controller/authentication_bloc/authentication_bloc.dart';
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
    sl.registerFactory(() => UserBloc(sl(), sl(), sl(), sl()));
    sl.registerFactory(() => TodoBloc(sl(), sl(), sl(), sl(), sl()));

    // sl.registerFactory(() => UserBloc(
    // createUserUseCase: sl(), loginUserCase: sl()));
    // authentciation Usecases
    sl.registerLazySingleton(() => LoginUseCase(sl()));
    sl.registerLazySingleton(() => CreateUserUseCase(sl()));
    sl.registerLazySingleton(() => LogOutUseCase(sl()));
    sl.registerLazySingleton(() => ChooseTypeUseCase(sl()));

    //todo usecases
    sl.registerLazySingleton(() => GetDoneTodoUseCase(sl()));
    sl.registerLazySingleton(() => GetUnDoneTodoUseCase(sl()));
    sl.registerLazySingleton(() => AddTodoUseCase(sl()));
    sl.registerLazySingleton(() => EditTodoUseCase(sl()));
    sl.registerLazySingleton(() => DeleteTodoUseCase(sl()));

    // Repository
    sl.registerLazySingleton<BaseUserRepository>(() => UserRepository(sl()));

    //todo repo
    sl.registerLazySingleton<BaseToDoRepository>(() => TodoRepository(sl()));

    // sl.registerLazySingleton<BaseUserRepository>(() => UserRepository(sl()));

    // Datasources

    //todo
    sl.registerLazySingleton<BaseTodoRemoteDateSource>(
        () => TodoRemoteDataSource());
    //authentication
    sl.registerLazySingleton<BaseUserRemoteDateSource>(
        () => UserRemoteDataSource());
  }
}
