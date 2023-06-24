import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit() : super(ForgetPasswordInitialState());
  static ForgetPasswordCubit get(context) => BlocProvider.of(context);

  TextEditingController codeController = TextEditingController();

  // IconData suffixNewPassowd = Icons.remove_red_eye_outlined;
  // IconData suffixConfirmNewPassword = Icons.remove_red_eye_outlined;
  bool isPasswordNewPassword = false;
  bool isPasswordConfirmNewPassword = false;

  bool isCheckedBox=false;

  void changeSuffixNewPassowd() {
    isPasswordNewPassword = !isPasswordNewPassword;

    emit(ChangeNewPasswordVisibilityState());
  }

  void changeSuffixConfirmNewPassword() {
    isPasswordConfirmNewPassword = !isPasswordConfirmNewPassword;
    emit(ChangeConfirmNewPasswordVisibilityState());
  }

  void checkUnCheckBox()
  {
    isCheckedBox=!isCheckedBox;
    emit(ChangeCheckBoxState());
  }


  void clearPinTextField() {
    codeController.text='';
    emit(ClearPinTextFieldState());
  }
}