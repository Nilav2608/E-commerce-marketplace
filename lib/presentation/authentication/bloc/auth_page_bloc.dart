import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fluxestore/repository/AuthRepo/auth_repository.dart';
// import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  late String rawToken;

  FutureOr<void> authPageLogInEvent(
      AuthPageLogInEvent event, Emitter<AuthPageState> emit) async {
    late SharedPreferences prefs;
    prefs = await SharedPreferences.getInstance();
    emit(ShowLoadingActionState());
    var results = await AuthRepository().login(event.email, event.password);
    var responseMessage = results['message'];
    var responseStatus = results['status'];
    if (results['status']) {
      //get the token
       rawToken = results['token'];
      // assign it to the prefs string token
      prefs.setString('token', rawToken);
      // Map<String, dynamic> decodedToken = JwtDecoder.decode(rawToken);
      // String id = decodedToken['_id'];
      // String email = decodedToken['email'];
      //emit snackbar
      emit(ShowSnackBarActionState(
          message: responseMessage, status: responseStatus));
      //emit landing page
      emit(AuthenticationSuccesState(token: rawToken));
    } else {
      emit(ShowSnackBarActionState(
          message: responseMessage, status: responseStatus));
    }
  }

  FutureOr<void> authPageSignUpEvent(
      AuthPageSignUpEvent event, Emitter<AuthPageState> emit) async {
    emit(ShowLoadingActionState());
    var results = await AuthRepository()
        .register(event.username, event.email, event.password);
    var responseMessage = results['message'];
    var responseStatus = results['status'];
    if (responseStatus) {
      emit(ShowSnackBarActionState(
          message: responseMessage, status: responseStatus));
      emit(RegisterationLoadingState());
      emit(ShowLoginPagePageState());
    }
  }
}
