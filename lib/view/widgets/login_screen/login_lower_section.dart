import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_mangement/view/constant/data.dart';
import 'package:hospital_mangement/view/constant/extensions.dart';
import 'package:hospital_mangement/view/constant/fonts.dart';
import 'package:hospital_mangement/view/core/buttons/main_button.dart';
import 'package:hospital_mangement/view/core/textfields/custom_text_form_filed.dart';
import 'package:hospital_mangement/view/screens/home_screen.dart';
import '../../../view_model/cubit/password_field_cubit/password_field_cubit.dart';
import '../../constant/color_manager.dart';
import '../../core/custom_text.dart';
import '../../screens/attendance_screens/touch_id_sensor_screen.dart';


class LoginLowerSection extends StatefulWidget {
  const LoginLowerSection({Key? key}) : super(key: key);

  @override
  State<LoginLowerSection> createState() => _LoginLowerSectionState();
}

class _LoginLowerSectionState extends State<LoginLowerSection> {
  final key = GlobalKey<FormState>();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var passwordCubit =
        BlocProvider.of<PasswordFieldCubit>(context, listen: true);
    return Form(
      child: Column(
        children: [
          Form(
            key: key,
            child: Column(
              children: [
                TextFormFieldsCustom(
                  controller: mobileController,
                  isPassword: false,
                  keyboardType: TextInputType.phone,
                  validator: (value){
                    if(value!.trim().isEmpty){
                      return 'Please enter phone number';
                    } else if(!RegExp(validationPhone).hasMatch(value.trim())){
                      return 'Phone Number must be valid';
                    }
                  },
                  prefixIcon: const Icon(
                    Icons.phone_outlined,
                    color: mainColor,
                  ),
                  enableInteractive: true,
                  labelText: 'Phone Number',
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormFieldsCustom(
                  controller: passwordController,
                  isPassword: passwordCubit.obscureText,
                  keyboardType: TextInputType.visiblePassword,
                  enableInteractive: false,
                  prefixIcon: const Icon(
                    Icons.lock_outline,
                    color: mainColor,
                  ),
                  suffixIcon: IconButton(
                    icon: passwordCubit.obscureText == true
                        ? const Icon(
                            Icons.visibility_off_outlined,
                            color: mainColor,
                          )
                        : const Icon(
                            Icons.visibility_outlined,
                            color: mainColor,
                          ),
                    onPressed: () {
                      passwordCubit.changePasswordVisibility();
                    },
                  ),
                  labelText: 'Password',
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return "Password must be not Empty";
                    }
                    else if (!value.trim().contains(RegExp(validatePasswordUpperCase))) {
                      return "Password must Contains UpperCase Letter";
                    }
                    else if (!value.trim().contains(RegExp(validatePasswordDigits))) {
                      return "Password must Contains Digit";
                    }
                    else if (!value.trim().contains(RegExp(validatePasswordLowerCase))) {
                      return "Password must Contains LowerCase Letter";
                    }
                    else if (!value
                        .trim()
                        .contains(RegExp(validatePasswordSpecialChar))) {
                      return "Password must Contains Special Character";
                    }
                    else if (value.trim().length < 8) {
                      return "Password must be more 8 Letters";
                    }
                    else if (!RegExp(
                        validationPassword)
                        .hasMatch(value.trim())) {
                      return "Password is not Valid";
                    }
                    return null;
                  },
                  onSaved: (value){
                    value = passwordController.text;
                  },
                  textInputAction: TextInputAction.next,

                ),
              ],
            ),
          ),
           Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomText(
                text: 'Forgot Password?',
                fontSize: textFont12,
                color: black,
                textDecoration: TextDecoration.underline,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          MainButton(
            title: 'Login',
            onTap: () {
              if (key.currentState!.validate()) {
                key.currentState!.save();
                context.push(const HomeScreen());
                // context.push();
                debugPrint('Validate Success');
              }else {
                debugPrint('fail');
              }
            },
          ),
        ],
      ),
    );
  }
}
