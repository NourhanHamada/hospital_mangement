part of 'attendance_cubit.dart';

@immutable
abstract class AttendanceState {}

class AttendanceInitial extends AttendanceState {}

class AttendanceDone extends AttendanceState {}
