part of 'create_call_cubit.dart';

@immutable
abstract class CreateCallState {}

class CreateCallInitial extends CreateCallState {}

class SelectDateState extends CreateCallState {}

class CreateCallLoading extends CreateCallState {}

class CreateCallSuccess extends CreateCallState {}

class CreateCallFail extends CreateCallState {}
