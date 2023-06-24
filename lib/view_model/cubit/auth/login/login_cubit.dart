import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../model/auth/login/login_model.dart';
import '../../../../view/constant/data.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context, listen: true);
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  String email = '';
  String password = '';
  bool isPasswordVisible = true;

  void emailChanged(String emailValue) {
    email = emailValue;
    emit(LoginLoading());
  }

  void passwordChanged(String passwordValue) {
    password = passwordValue;
    emit(LoginLoading());
  }



  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    emit(PasswordShow());
  }

  void formValidation() {
    if (!RegExp(validationEmail).hasMatch(email) ||
        !RegExp(validationPassword).hasMatch(password)) {
      emit(TextFieldInvalid(
          error: 'Incorrect Email or Password. Please try again'));
    } else {
      emit(TextFieldValid());
    }
  }

  void login(BuildContext context) {
    print(email);
    print(password);
    final form = formKey.currentState;
    if (form!.validate()) {
      form.save();
      // auth.login(email, password).then((response) {});
    } else {
      //   Flushbar(
      //       title: "Invalid Form",
      //       message: 'please complete the form properly',
      //       duration: const Duration(seconds: 10))
      //       .show(context);
      // }
    }
  }
}