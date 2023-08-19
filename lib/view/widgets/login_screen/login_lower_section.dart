import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_mangement/view/constant/data.dart';
import 'package:hospital_mangement/view/constant/extensions.dart';
import 'package:hospital_mangement/view/constant/fonts.dart';
import 'package:hospital_mangement/view/core/buttons/main_button.dart';
import 'package:hospital_mangement/view/core/textfields/custom_text_form_filed.dart';
import 'package:hospital_mangement/view/screens/home_screen.dart';
import '../../../view_model/cubit/auth/login/login_cubit.dart';
import '../../../view_model/cubit/password_field_cubit/password_field_cubit.dart';
import '../../constant/color_manager.dart';
import '../../core/component.dart';
import '../../core/custom_text.dart';

class LoginLowerSection extends StatefulWidget {
  const LoginLowerSection({Key? key}) : super(key: key);

  @override
  State<LoginLowerSection> createState() => _LoginLowerSectionState();
}

class _LoginLowerSectionState extends State<LoginLowerSection> {
  @override
  Widget build(BuildContext context) {
    var passwordCubit =
        BlocProvider.of<PasswordFieldCubit>(context, listen: true);
    LoginCubit loginCubit = BlocProvider.of(context, listen: true);
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          showDialog(
            context: context,
            barrierColor: Colors.transparent,
            builder: (BuildContext context) {
              return const Center(
                child: CircularProgressIndicator(
                  color: mainColor,
                ),
              );
            },
          );
        }
        if (state is LoginSuccess) {
          context.pop();
          if (loginCubit.status == '0') {
            showToast(message: loginCubit.errorMessage);
          } else {
            showToast(message: 'Logged in Successfully');
            context.push(const HomeScreen());
          }
        }
        if (state is LoginError) {
          context.pop();
        }
      },
      builder: (context, state) {
        return Form(
          child: Column(
            children: [
              Form(
                key: loginCubit.formKey,
                child: Column(
                  children: [
                    TextFormFieldsCustom(
                      labelDividerColor: mainColor,
                      controller: loginCubit.emailController,
                      isPassword: false,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'Please enter email';
                        } else if (!RegExp(validationEmail)
                            .hasMatch(value.trim())) {
                          return 'email must be valid';
                        }
                        return null;
                      },
                      prefixIcon: const Icon(
                        Icons.email_outlined,
                        color: mainColor,
                      ),
                      enableInteractive: true,
                      labelText: 'Email',
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormFieldsCustom(
                      controller: loginCubit.passwordController,
                      labelDividerColor: mainColor,
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
                        } else if (!value
                            .trim()
                            .contains(RegExp(validatePasswordUpperCase))) {
                          return "Password must Contains UpperCase Letter";
                        } else if (!value
                            .trim()
                            .contains(RegExp(validatePasswordDigits))) {
                          return "Password must Contains Digit";
                        } else if (!value
                            .trim()
                            .contains(RegExp(validatePasswordLowerCase))) {
                          return "Password must Contains LowerCase Letter";
                        } else if (!value
                            .trim()
                            .contains(RegExp(validatePasswordSpecialChar))) {
                          return "Password must Contains Special Character";
                        } else if (value.trim().length < 8) {
                          return "Password must be more 8 Letters";
                        } else if (!RegExp(validationPassword)
                            .hasMatch(value.trim())) {
                          return "Password is not Valid";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        // value = loginCubit.passwordController.text;
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
                  if (loginCubit.formKey.currentState!.validate()) {
                    loginCubit.formKey.currentState!.save();
                    loginCubit.loginData(
                      context: context,
                        email: loginCubit.emailController.text,
                        password: loginCubit.passwordController.text);
                    // context.push(const HomeScreen());
                  } else {
                    debugPrint('fail');
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
