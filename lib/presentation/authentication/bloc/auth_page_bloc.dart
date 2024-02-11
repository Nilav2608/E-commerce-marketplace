import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fluxestore/repository/AuthRepo/auth_repository.dart';
import 'package:meta/meta.dart';

part 'auth_page_event.dart';
part 'auth_page_state.dart';

class AuthPageBloc extends Bloc<AuthPageEvent, AuthPageState> {
  AuthPageBloc() : super(AuthPageInitial()) {
    on<AuthPageInitailEvent>(authPageInitailEvent);
    on<AuthPageShowLoginPageEvent>(authPageShowLoginPageEvent);
    on<AuthPageShowSignUpPageEvent>(authPageShowSignUpPageEvent);
    on<AuthPageLogInEvent>(authPageLogInEvent);
    on<AuthPageSignUpEvent>(authPageSignUpEvent);
  }

  FutureOr<void> authPageInitailEvent(
      AuthPageInitailEvent event, Emitter<AuthPageState> emit) {
    emit(ShowSignUpPageState());
  }

  FutureOr<void> authPageShowLoginPageEvent(
      AuthPageShowLoginPageEvent event, Emitter<AuthPageState> emit) {
    emit(ShowLoginPagePageState());
  }

  FutureOr<void> authPageShowSignUpPageEvent(
      AuthPageShowSignUpPageEvent event, Emitter<AuthPageState> emit) {
    emit(ShowSignUpPageState());
  }

  FutureOr<void> authPageLogInEvent(
      AuthPageLogInEvent event, Emitter<AuthPageState> emit) async {}

  FutureOr<void> authPageSignUpEvent(
      AuthPageSignUpEvent event, Emitter<AuthPageState> emit) async {
    emit(ShowLoadingActionState());
    var results = await AuthRepository()
        .register(event.username, event.email, event.password);
    var responseMessage = results['message'];
    if (results['status']) {
      emit(ShowSnackBarActionState(message: responseMessage));
      emit(RegisterationLoadingState());
      emit(ShowLoginPagePageState());
    }
  }
}
