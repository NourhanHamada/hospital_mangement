import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_mangement/view/constant/data.dart';
import 'package:hospital_mangement/view_model/database/network/dio_helper.dart';

import '../../database/network/end_points.dart';

part 'attendance_state.dart';

class AttendanceCubit extends Cubit<AttendanceState> {
  AttendanceCubit() : super(AttendanceInitial());

  AttendanceCubit get(context) => BlocProvider.of(context);

  String text = 'Please touch ID sensor to verify registration';
  final String text2 = 'Your attendance has been registered';
  bool isAttend = false;
  bool isLeaving = false;
  bool isVisible = false;
  String timeAttend = '00:00';
  String timeLeave = '00:00';

  void attendanceDone() {
    isAttend = true;
    isVisible = true;
    text = text2;
    timeAttend = DateFormat('hh:mm a').format(DateTime.now());
    emit(AttendanceDone());
  }

  void leavingDone() {
    isLeaving = true;
    timeLeave = DateFormat('hh:mm a').format(DateTime.now());
    emit(LeavingDone());
  }

  late String attendOrLeave;
  void attendanceAndLeaving(
  // {
    // required String status,
  // }
  ) async {
    emit(AttendanceLoading());
    var data = {
      'status': attendOrLeave,
    };
    await DioHelper.postData(
      url: attendance,
      data: data,
      token: userAccessToken,
    ).then((value)  {
      print(value.data.toString());
      emit(AttendanceSuccess());
    }).catchError((onError) {
      print(onError.toString());
      emit(AttendanceFail());
    });
  }
}
