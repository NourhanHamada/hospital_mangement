import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'password_field_state.dart';

class PasswordFieldCubit extends Cubit<PasswordFieldState> {
  PasswordFieldCubit() : super(PasswordFieldInitial());

  PasswordFieldCubit get(context) => BlocProvider.of(context);


  bool obscureText = true;
  void changePasswordVisibility()
  {
    obscureText = !obscureText;
    emit(ChangeObscureText());
  }
}
