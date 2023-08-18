import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_mangement/view_model/database/network/dio_helper.dart';
import 'package:hospital_mangement/view_model/database/network/end_points.dart';

part 'new_user_state.dart';

class NewUserCubit extends Cubit<NewUserState> {
  NewUserCubit() : super(NewUserInitial());

  NewUserCubit get(context) => BlocProvider.of(context);

  final newUserFormKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController specialistController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool obscureText = true;
  bool isLoading = false;

  void changePasswordVisibility() {
    obscureText = !obscureText;
    emit(ChangeObscureText());
  }

  createNewUser({
    required String firstName,
    required String lastName,
    required String gender,
    required String specialist,
    required String status,
    required String dateOfBirth,
    required String phoneNumber,
    required String email,
    required String address,
    required String password,
    required String type,
  }) async {
    emit(NewUserLoading());
    debugPrint('LOADING!!');
    debugPrint('LOADING!!');
    debugPrint('LOADING!!');
    debugPrint('LOADING!!');
    var data  = {
      "first_name": firstName,
      "last_name": lastName,
      "mobile": phoneNumber,
      "email": email,
      'password' : password,
      "gender": gender,
      "status": status,
      "specialist": specialist,
      "type": type,
      "birthday": dateOfBirth,
      "address": address,
    };
    await DioHelper.postData(
      url: register,
      data: data
    ).then((value) {
      debugPrint(value.data.toString());
      debugPrint('SUCCESS!!');
      debugPrint('SUCCESS!!');
      debugPrint('SUCCESS!!');
      debugPrint('SUCCESS!!');
      emit(NewUserSuccess());
    }).catchError((onError) {
      debugPrint('ERROR ============================>>');
      debugPrint(onError.toString());
      debugPrint('FAIL!!');
      debugPrint('FAIL!!');
      debugPrint('FAIL!!');
      debugPrint('FAIL!!');
      emit(NewUserFail());
    });
  }
}
