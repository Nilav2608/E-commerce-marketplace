part of 'auth_page_bloc.dart';

@immutable
sealed class AuthPageState {}

final class AuthPageInitial extends AuthPageState {}

abstract class AuthPageActionState extends AuthPageState {}

class ShowSignUpPageState extends AuthPageState {}

class ShowLoginPagePageState extends AuthPageState {}

class ShowLoadingActionState extends AuthPageActionState {}

class ShowSnackBarActionState extends AuthPageActionState {
  final String message;
  final bool status;

  ShowSnackBarActionState({required this.status, required this.message});
}

class RegisterationLoadingState extends AuthPageActionState {}

class AuthenticationLoadingState extends AuthPageActionState {}

class RegistrationSuccessState extends AuthPageState {}

class AuthenticationSuccesState extends AuthPageState {
  final String token;

  AuthenticationSuccesState({required this.token});
}
