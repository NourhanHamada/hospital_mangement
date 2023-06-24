part of 'password_field_cubit.dart';

@immutable
abstract class PasswordFieldState {}

class PasswordFieldInitial extends PasswordFieldState {}

class ChangeObscureText extends PasswordFieldState{}