part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class DoctorState extends HomeState {}

class ReceptionistState extends HomeState {}
