import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/authentication/data/models/user_model.dart';
import 'package:frontend/authentication/domaine/usecases/choose_type_usecase.dart';
import 'package:frontend/authentication/domaine/usecases/get_user_detaills_usecase.dart';
import 'package:frontend/authentication/domaine/usecases/login_usecase.dart';
import 'package:frontend/authentication/domaine/usecases/logout_usecase.dart';
import 'package:frontend/authentication/domaine/usecases/set_biography_usecase.dart';
import 'package:frontend/authentication/domaine/usecases/signup_usecase.dart';
import 'package:frontend/authentication/presentation/controller/authentication_bloc/authentication_event.dart';
import 'package:frontend/authentication/presentation/controller/authentication_bloc/authentication_state.dart';
import 'package:frontend/cores/error/failure.dart';

class UserBloc extends Bloc<UserBlocEvent, UserBlocState> {
  final LoginUseCase loginUserCase;
  final CreateUserUseCase createUserUseCase;
  final LogOutUseCase logOutUseCase;
  final ChooseTypeUseCase chooseTypeUseCase;
  final SetBiographyUseCase setBiographyUseCase;
  final GetUserDetailsUseCase getUserDetailsUseCase;

  UserBloc(
    this.loginUserCase,
    this.createUserUseCase,
    this.logOutUseCase,
    this.chooseTypeUseCase,
    this.setBiographyUseCase,
    this.getUserDetailsUseCase,
  ) : super(UserBlocStateInitial()) {
    on<UserBlocEvent>((event, emit) async {
      if (event is CreateUserEvent) {
        emit(LodingUserBlocState());
        final failuerOrDoneMessage = await createUserUseCase(event.user);
        emit(_eitherDoneMessageOrErrorState(
            result: failuerOrDoneMessage, message: "ADD_SUCCESS_MESSAGE"));
      } else if (event is LoginuserEvent) {
        emit(LodingUserBlocState());
        final failuerOrDoneMessage = await loginUserCase(event.user);
        emit(_login(
            result: failuerOrDoneMessage, message: "UPDATE_SUCCESS_MESSAG"));
      } else if (event is LogOutUserEvent) {
        emit(LodingUserBlocState());
        final failuerOrDoneMessage = await logOutUseCase();
        emit(_logOut(
            result: failuerOrDoneMessage, message: "UPDATE_SUCCESS_MESSAG"));
      } else if (event is ChooseTypeEvent) {
        emit(LodingUserBlocState());
        final failuerOrDoneMessage = await chooseTypeUseCase(event.number);
        emit(_chooseType(
            result: failuerOrDoneMessage, message: "choosing Type success"));
      } else if (event is SetBiographyEvent) {
        emit(LodingUserBlocState());
        final failuerOrDoneMessage = await setBiographyUseCase(event.bio);
        emit(_setBio(
            result: failuerOrDoneMessage, message: "choosing Type success"));
      } else if (event is GetUserDetailsEvent) {
        emit(LodingUserBlocState());
        final failuerOrDoneMessage = await getUserDetailsUseCase(event.id);
        emit(_getUserDetails(
            result: failuerOrDoneMessage, message: "choosing Type success"));
      }
    });
  }

  UserBlocState _eitherDoneMessageOrErrorState(
      {required Either<Failure, bool> result, required String message}) {
    return result.fold((l) => ErrorUserBlocState(message: l.message),
        (r) => const MessageUserBlocState(message: "ADD_SUCCESS_MESSAGE"));
  }

  UserBlocState _logOut(
      {required Either<Failure, bool> result, required String message}) {
    return result.fold(
        (l) => ErrorUserBlocState(message: _mapFailureToMessage(l)),
        (r) => SignOuState());
  }

  UserBlocState _chooseType(
      {required Either<Failure, int> result, required String message}) {
    return result.fold((l) {
      return ErrorUserBlocState(message: _mapFailureToMessage(l));
    }, (r) {
      if (r == 1) {
        return StudentLoginState();
      } else if (r == 2) {
        return TeacherLoginState();
      } else {
        return StudentLoginState();
      }
    });
  }

  UserBlocState _setBio(
      {required Either<Failure, Unit> result, required String message}) {
    return result.fold((l) {
      return ErrorUserBlocState(message: _mapFailureToMessage(l));
    }, (r) {
      log("success bio funciton");
      return BioSuccessState();
    });
  }

  UserBlocState _getUserDetails(
      {required Either<Failure, UserModel> result, required String message}) {
    return result.fold((l) {
      return ErrorUserBlocState(message: _mapFailureToMessage(l));
    }, (r) {
      log("success bio funciton");
      return UserDetailState(usermodel: r);
    });
  }

  UserBlocState _login(
      {required Either<Failure, int> result, required String message}) {
    return result.fold((l) {
      return ErrorUserBlocState(message: l.message);
    }, (r) {
      if (r == 1) {
        return StudentLoginState();
      } else if (r == 2) {
        return TeacherLoginState();
      } else {
        return StudentLoginState();
      }
    });
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
