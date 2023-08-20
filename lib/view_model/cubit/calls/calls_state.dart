part of 'calls_cubit.dart';

@immutable
abstract class CallsState {}

class CallsInitial extends CallsState {}

class GetCallsLoading extends CallsState {}

class GetCallsSuccess extends CallsState {}

class GetCallsFail extends CallsState {}
