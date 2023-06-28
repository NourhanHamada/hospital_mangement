import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'attendance_state.dart';

class AttendanceCubit extends Cubit<AttendanceState> {
  AttendanceCubit() : super(AttendanceInitial());

  AttendanceCubit get(context) => BlocProvider.of(context);

  String text = 'Please touch ID sensor to verify registration';
  final String text2 = 'Your attendance has been registered';
  bool isAttend = false;
  bool isVisible = false;

  void attendanceDone(){
    isAttend = !isAttend;
    isVisible = true;
    text = text2;
    emit(AttendanceDone());
  }
}
