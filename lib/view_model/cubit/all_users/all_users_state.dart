part of 'all_users_cubit.dart';

@immutable
abstract class AllUsersState {}

class AllUsersInitial extends AllUsersState {}

class GetAllUsersLoading extends AllUsersState {}

class GetAllUsersSuccess extends AllUsersState {}

class GetAllUsersFail extends AllUsersState {}
