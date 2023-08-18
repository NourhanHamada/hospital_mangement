part of 'new_user_cubit.dart';

@immutable
abstract class NewUserState {}

class NewUserInitial extends NewUserState {}

class ChangeObscureText extends NewUserState {}

class NewUserLoading extends NewUserState {}

class NewUserSuccess extends NewUserState {}

class NewUserFail extends NewUserState {}
