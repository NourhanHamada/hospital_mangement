part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  // LoginModel loginModel;
  // LoginSuccess({required this.loginModel});
}

class LoginError extends LoginState {}

class PasswordShow extends LoginState {}

class TextFieldValid extends LoginState {}

class TextFieldInvalid extends LoginState {
  final String? error;

  TextFieldInvalid({required this.error});
}
