import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_mangement/view/constant/data.dart';
import 'package:hospital_mangement/view_model/cubit/all_users/all_users_cubit.dart';
import 'package:hospital_mangement/view_model/database/local/cache_helper.dart';
import 'package:hospital_mangement/view_model/database/network/dio_helper.dart';
import 'package:hospital_mangement/view_model/database/network/end_points.dart';

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

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    emit(PasswordShow());
  }

// late LoginModel loginModel;
  late String errorMessage;
  late String status;
  void loginData({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    emit(LoginLoading());
    var date = {
      'email': email,
      'password': password,
    };
    await DioHelper.postData(
      url: login,
      data: date,
    ).then((value) {
      // loginModel = LoginModel.fromJson(value.data);
      debugPrint(value.toString());
      if(value.data['status'].toString() == '1') {
        status = '1';
        CacheHelper.put(key: firstNameKey, value: value.data['data']['first_name']);
        CacheHelper.put(key: lastNameKey, value: value.data['data']['last_name']);
        CacheHelper.put(key: genderKey, value: value.data['data']['gender']);
        CacheHelper.put(key: specialistKey, value: value.data['data']['specialist']);
        CacheHelper.put(key: phoneNumberKey, value: value.data['data']['mobile']);
        CacheHelper.put(key: emailKey, value: value.data['data']['email']);
        CacheHelper.put(key: statusKey, value: value.data['data']['status']);
        CacheHelper.put(key: dateOfBirthKey, value: value.data['data']['birthday']);
        CacheHelper.put(key: addressKey, value: value.data['data']['address']);
        CacheHelper.put(key: accessTokenKey, value: value.data['data']['access_token']);
        userFirstName = CacheHelper.get(key: firstNameKey);
        userLastName = CacheHelper.get(key: lastNameKey);
        userGender = CacheHelper.get(key: genderKey);
        userSpecialist = CacheHelper.get(key: specialistKey);
        userPhoneNumber = CacheHelper.get(key: phoneNumberKey);
        userEmail = CacheHelper.get(key: emailKey);
        userStatus = CacheHelper.get(key: statusKey);
        userDateOfBirth = CacheHelper.get(key: dateOfBirthKey);
        userAddress = CacheHelper.get(key: addressKey);
        userAccessToken = CacheHelper.get(key: accessTokenKey);

        print(userAccessToken);
        AllUsersCubit().get(context).getAllUsers(specialist: 'All');
      } else {
        status = '0';
        errorMessage = value.data['message'].toString();
      }
      emit(LoginSuccess());
    }).catchError((onError) {
      debugPrint('ERROR!!!!!!!!!!!!!!!');
      debugPrint(onError.toString());
      emit(LoginError());
    });
  }
}
