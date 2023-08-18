import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      token: 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiZGEwNjQ2MWMyYmFkMzE4NTRmOTk0NzQ3NDU5M2VlNmQ5Yjk2NjFlOGE1ZWFhMGU3MTE4N2Q1MDYzYTFkODQzM2Y0ODg5MzdjMjA4MjZlMTIiLCJpYXQiOjE2OTIzNjIyNzYuOTcxMTY1LCJuYmYiOjE2OTIzNjIyNzYuOTcxMTcsImV4cCI6MTcyMzk4NDY3Ni45Njk3Niwic3ViIjoiMzQxIiwic2NvcGVzIjpbXX0.BKdUxa2zFJcH_xReFTF_VV_1xXE6hd58A3r-EPP16pUwZaCv-Sxt7NHCLcVCE2VXIocEDUSNl_gdaOviNfexSj2uDI91Y-CzdsKN2xdHG7afbWh0tWS4QZn_oV4YeTSjA9MnpOwUw2m29gaqzJgHF45NfSh0w2DzJrbV8AxsWj-TuyIHrAis7xj5G0JLt1M16gA7yHz61DI5ob9eMuN24y-lqwm2pPeP6bzogNbQF-QiG4KiZzgpiwNp4fmH0onqe9T5isaQWWyl1Vs0CJT4jetPcz12rp_EsP6SG7CejH-wimCiirr9TwCytWFQAmjAXs-cw9BiuXevlbgd7RFtEWvaMP4l1uYAili72Mb1bsIU3Kuncp2X1vsFCVqaudrOZLKtZ0EH8FtXA-5imvz6mymBFm-okGeUlhL3ja9rZauiJNH-82BH_sD6Ic3XjKrxmpyDONt3HjqHaWIUyeq0eV_VrfYBLhYDUWK7lU-191Sb7w1cgmhUbsphzuThXoEYfoat-fnefXr1vX1n5dl5mRLI9xN_WJ7tZzzsbN0r665bcSdmUAV3bfy4EAv7Q7pjk4mEOi_6JCwIj67oanS7IV92OCClWprPUnlOC6NJ-JjmPhzrwREAOOoimUQOteXQtQpneV8fBh1g8Ei74vHMNVOJ54Cx6GtXvL8M02zHDFs'
    ).then((value)  {
      print(value.data.toString());
      emit(AttendanceSuccess());
    }).catchError((onError) {
      print(onError.toString());
      emit(AttendanceFail());
    });
  }
}
