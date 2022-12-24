import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/authentication/domaine/usecases/login_usecase.dart';
import 'package:frontend/authentication/domaine/usecases/logout_usecase.dart';
import 'package:frontend/authentication/domaine/usecases/signup_usecase.dart';
import 'package:frontend/authentication/presentation/controller/authentication_bloc/authentication_event.dart';
import 'package:frontend/authentication/presentation/controller/authentication_bloc/authentication_state.dart';
import 'package:frontend/cores/error/failure.dart';

class UserBloc extends Bloc<UserBlocEvent, UserBlocState> {
  final LoginUseCase loginUserCase;
  final CreateUserUseCase createUserUseCase;
  final LogOutUseCase logOutUseCase;

  UserBloc(
    this.loginUserCase,
    this.createUserUseCase,
    this.logOutUseCase,
  ) : super(UserBlocStateInitial()) {
    on<UserBlocEvent>((event, emit) async {
      if (event is CreateUserEvent) {
        emit(LodingUserBlocState());
        final failuerOrDoneMessage = await createUserUseCase(event.user);
        log(failuerOrDoneMessage.toString());
        emit(_eitherDoneMessageOrErrorState(
            result: failuerOrDoneMessage, message: "ADD_SUCCESS_MESSAGE"));
      } else if (event is LoginuserEvent) {
        emit(LodingUserBlocState());
        final failuerOrDoneMessage = await loginUserCase(event.user);
        emit(_eitherDoneMessageOrErrorState(
            result: failuerOrDoneMessage, message: "UPDATE_SUCCESS_MESSAG"));
      } else if (event is LogOutUserEvent) {
        log("in logging out user event block  ");
        emit(LodingUserBlocState());
        final failuerOrDoneMessage = await logOutUseCase();
        emit(_logOut(
            result: failuerOrDoneMessage, message: "UPDATE_SUCCESS_MESSAG"));
      }
    });
  }

  UserBlocState _eitherDoneMessageOrErrorState(
      {required Either<Failure, bool> result, required String message}) {
    log(result.toString());
    log("before result fold ");
    return result.fold((l) => ErrorUserBlocState(message: l.message),
        (r) => const MessageUserBlocState(message: "ADD_SUCCESS_MESSAGE"));
  }

  UserBlocState _logOut(
      {required Either<Failure, bool> result, required String message}) {
    log("in loging out funcion");
    return result.fold(
        (l) => ErrorUserBlocState(message: _mapFailureToMessage(l)),
        (r) => SignOuState());
  }
}

String _mapFailureToMessage(Failure failure) {
  switch (failure.message) {
    case "user-not-found":
      return "Invalid Creds";
    case "wrong-passord":
      return "Wrong Password";
    case "invalid-email":
      return "Invalid Email Adress";
    case "user-disabled":
      return "User Disables";
    case "email-already-in-use":
      return "Email Already In Use";
    case "operation-not-allowed":
      return "Error";
    case "weak-password":
      return "Weak Password";
  }
  return "Uknown Error ";
}
