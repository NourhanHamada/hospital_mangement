import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hospital_mangement/view/constant/assets.dart';
import 'package:hospital_mangement/view/constant/color_manager.dart';
import 'package:hospital_mangement/view/constant/data.dart';
import 'package:hospital_mangement/view/constant/extensions.dart';
import 'package:hospital_mangement/view/core/buttons/main_button.dart';
import 'package:hospital_mangement/view/core/custom_text.dart';
import 'package:hospital_mangement/view/core/scaffold_custom/background_scaffold.dart';
import 'package:hospital_mangement/view/core/textfields/custom_text_form_filed.dart';
import 'package:hospital_mangement/view/screens/hr_screens/employee_list_screen.dart';
import 'package:hospital_mangement/view_model/cubit/new_user/new_user_cubit.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../view_model/cubit/theme/theme_cubit.dart';
import '../../constant/fonts.dart';
import '../../core/component.dart';

class NewUserScreen extends StatefulWidget {
  const NewUserScreen({super.key});

  @override
  State<NewUserScreen> createState() => _NewUserScreenState();
}

class _NewUserScreenState extends State<NewUserScreen> {
  var _selectedDay = DateTime.now();
  var _focusDay;

  @override
  Widget build(BuildContext context) {
    NewUserCubit newUserCubit = BlocProvider.of(context, listen: true);
    return BackgroundScaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      context.pop();
                    },
                  ),
                  const Spacer(),
                  CustomText(
                    text: 'New User',
                    color: black,
                  ),
                  const Spacer(),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Form(
                key: newUserCubit.newUserFormKey,
                child: Column(
                  children: [
                    TextFormFieldsCustom(
                      enableInteractive: false,
                      controller: newUserCubit.firstNameController,
                      labelDividerColor: mainColor,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SvgPicture.asset(
                          user2,
                          colorFilter: const ColorFilter.mode(
                            mainColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                      labelText: 'First Name',
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'First name must be not empty';
                        } else if (!RegExp(validationName)
                            .hasMatch(value.trim())) {
                          return 'First name is not valid';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormFieldsCustom(
                      enableInteractive: false,
                      controller: newUserCubit.lastNameController,
                      labelDividerColor: mainColor,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SvgPicture.asset(
                          user2,
                          colorFilter: const ColorFilter.mode(
                            mainColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                      labelText: 'Last Name',
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'Last name must be not empty';
                        } else if (!RegExp(validationName)
                            .hasMatch(value.trim())) {
                          return 'Last name is not valid';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    DropdownButtonFormField2<String>(
                      value: newUserCubit.genderController.text.isNotEmpty
                          ? newUserCubit.genderController.text
                          : null,
                      isExpanded: true,
                      decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: SvgPicture.asset(gender),
                        ),
                        label: Row(
                          children: [
                            Container(
                              width: 1.2,
                              height: 20,
                              color: mainColor,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            CustomText(
                              text: 'Gender',
                              color: grey700,
                              fontWeight: FontWeight.w400,
                              fontSize: textFont12,
                            ),
                          ],
                        ),
                        fillColor:
                            ThemeCubit.get(context).isDark ? toastColor : white,
                        filled: true,
                        isDense: true,
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: grey400,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: mainColor,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: grey400,
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 16,
                        ),
                        errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.red,
                              // color: Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.red,
                              // color: Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      items: <String>['Male', 'Female']
                          .map(
                            (e) => DropdownMenuItem<String>(
                              value: e,
                              child: CustomText(
                                text: e,
                                color: grey800,
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        newUserCubit.genderController.text = value!;
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Please Select Gender';
                        }
                        return null;
                      },
                      buttonStyleData: const ButtonStyleData(),
                      iconStyleData: const IconStyleData(
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: grey600,
                        ),
                        iconSize: 24,
                      ),
                      dropdownStyleData: DropdownStyleData(
                        maxHeight: context.screenHeight / 4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: grey100,
                        ),
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        padding: EdgeInsets.only(left: 8),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    DropdownButtonFormField2<String>(
                      value: newUserCubit.specialistController.text.isNotEmpty
                          ? newUserCubit.specialistController.text
                          : null,
                      isExpanded: true,
                      decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: SvgPicture.asset(specialist),
                        ),
                        label: Row(
                          children: [
                            Container(
                              width: 1.2,
                              height: 20,
                              color: mainColor,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            CustomText(
                              text: 'Specialist',
                              color: grey700,
                              fontWeight: FontWeight.w400,
                              fontSize: textFont12,
                            ),
                          ],
                        ),
                        fillColor:
                            ThemeCubit.get(context).isDark ? toastColor : white,
                        filled: true,
                        isDense: true,
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: grey400,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: mainColor,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: grey400,
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 16,
                        ),
                        errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.red,
                              // color: Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.red,
                              // color: Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      items: <String>[
                        'Doctor',
                        'Receptionist',
                        'Nurse',
                        'Analysis Employee',
                        'Manager',
                        'HR'
                      ]
                          .map(
                            (e) => DropdownMenuItem<String>(
                              value: e,
                              child: CustomText(
                                text: e,
                                color: grey800,
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        newUserCubit.specialistController.text = value!;
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Please Select Specialist';
                        }
                        return null;
                      },
                      buttonStyleData: const ButtonStyleData(),
                      iconStyleData: const IconStyleData(
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: grey600,
                        ),
                        iconSize: 24,
                      ),
                      dropdownStyleData: DropdownStyleData(
                        maxHeight: context.screenHeight / 4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: grey100,
                        ),
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        padding: EdgeInsets.only(left: 8),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    DropdownButtonFormField2<String>(
                      value: newUserCubit.statusController.text.isNotEmpty
                          ? newUserCubit.statusController.text
                          : null,
                      isExpanded: true,
                      decoration: InputDecoration(
                        prefixIcon: SvgPicture.asset(
                          heart,
                          fit: BoxFit.scaleDown,
                        ),
                        label: Row(
                          children: [
                            Container(
                              width: 1.2,
                              height: 20,
                              color: mainColor,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            CustomText(
                              text: 'Status',
                              color: grey700,
                              fontWeight: FontWeight.w400,
                              fontSize: textFont12,
                            ),
                          ],
                        ),
                        fillColor:
                            ThemeCubit.get(context).isDark ? toastColor : white,
                        filled: true,
                        isDense: true,
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: grey400,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: mainColor,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: grey400,
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 16,
                        ),
                        errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.red,
                              // color: Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.red,
                              // color: Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      items: <String>[
                        'Single',
                        'Engaged',
                        'Married',
                      ]
                          .map(
                            (e) => DropdownMenuItem<String>(
                              value: e,
                              child: CustomText(
                                text: e,
                                color: grey800,
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        newUserCubit.statusController.text = value!;
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Please Select Status';
                        }
                        return null;
                      },
                      buttonStyleData: const ButtonStyleData(),
                      iconStyleData: const IconStyleData(
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: grey600,
                        ),
                        iconSize: 24,
                      ),
                      dropdownStyleData: DropdownStyleData(
                        maxHeight: context.screenHeight / 4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: grey100,
                        ),
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        padding: EdgeInsets.only(left: 8),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormFieldsCustom(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          builder: (BuildContext context) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TableCalendar(
                                calendarStyle: CalendarStyle(
                                  rangeHighlightColor: mainColor,
                                  todayDecoration: const BoxDecoration(
                                    color: Colors.transparent,
                                    shape: BoxShape.circle,
                                  ),
                                  todayTextStyle: const TextStyle(
                                    color: mainColor,
                                  ),
                                  selectedDecoration: BoxDecoration(
                                      color: mainColor.withOpacity(.1),
                                      shape: BoxShape.circle),
                                  selectedTextStyle: const TextStyle(
                                    color: mainColor,
                                  ),
                                ),
                                onDaySelected: (selectedDay, focusDay) {
                                  setState(() {
                                    _selectedDay = selectedDay;
                                    _focusDay = focusDay;
                                    newUserCubit.dateOfBirthController.text =
                                        DateFormat('yyyy-MM-dd')
                                            .format(_selectedDay);
                                    context.pop();
                                  });
                                },
                                selectedDayPredicate: (day) {
                                  return isSameDay(_selectedDay, day);
                                },
                                daysOfWeekHeight: 30,
                                focusedDay: DateTime(1996),
                                firstDay: DateTime(1970),
                                // lastDay: DateTime.utc(2023, 10, 10),
                                lastDay: DateTime(2000),
                              ),
                            );
                          },
                        );
                      },
                      enableInteractive: false,
                      keyboardType: TextInputType.none,
                      controller: newUserCubit.dateOfBirthController,
                      labelDividerColor: mainColor,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SvgPicture.asset(
                          calendar,
                          colorFilter: const ColorFilter.mode(
                            mainColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                      labelText: 'Date of birth',
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'Date if birth must be not empty';
                        }
                        // else if (!RegExp(validationPhone)
                        //     .hasMatch(value.trim())) {
                        //   return 'Date of birth is not valid';
                        // }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormFieldsCustom(
                      enableInteractive: false,
                      keyboardType: TextInputType.phone,
                      controller: newUserCubit.phoneNumberController,
                      labelDividerColor: mainColor,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SvgPicture.asset(
                          phone,
                          colorFilter: const ColorFilter.mode(
                            mainColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                      labelText: 'Phone Number',
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'Phone Number must be not empty';
                        } else if (!RegExp(validationPhone)
                            .hasMatch(value.trim())) {
                          return 'Phone Number is not valid';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormFieldsCustom(
                      enableInteractive: false,
                      keyboardType: TextInputType.emailAddress,
                      controller: newUserCubit.emailController,
                      labelDividerColor: mainColor,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SvgPicture.asset(
                          email2,
                          colorFilter: const ColorFilter.mode(
                            mainColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                      labelText: 'E-mail',
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'E-mail must be not empty';
                        } else if (!RegExp(validationEmail)
                            .hasMatch(value.trim())) {
                          return 'E-mail is not valid';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormFieldsCustom(
                      enableInteractive: false,
                      controller: newUserCubit.addressController,
                      labelDividerColor: mainColor,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SvgPicture.asset(
                          location,
                          colorFilter: const ColorFilter.mode(
                            mainColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                      labelText: 'Address',
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'Address must be not empty';
                        } else if (!RegExp(validationName)
                            .hasMatch(value.trim())) {
                          return 'Address is not valid';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormFieldsCustom(
                      enableInteractive: false,
                      isPassword: newUserCubit.obscureText,
                      controller: newUserCubit.passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      labelDividerColor: mainColor,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SvgPicture.asset(
                          lock,
                          colorFilter: const ColorFilter.mode(
                            mainColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                      suffixIcon: IconButton(
                        icon: newUserCubit.obscureText == true
                            ? const Icon(
                                Icons.visibility_off_outlined,
                                color: mainColor,
                              )
                            : const Icon(
                                Icons.visibility_outlined,
                                color: mainColor,
                              ),
                        onPressed: () {
                          newUserCubit.changePasswordVisibility();
                        },
                      ),
                      labelText: 'Password',
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'Password must be not empty';
                        } else if (!RegExp(validationPassword)
                            .hasMatch(value.trim())) {
                          return 'Password is not valid';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              BlocConsumer<NewUserCubit, NewUserState>(
                listener: (context, state) {
                  if (state is NewUserLoading) {
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
                  if(state is NewUserSuccess) {
                    context.pop();
                    showToast(message: 'User Created Successfully! <3');
                    Future.delayed(const Duration(seconds: 2), (){
                      context.push(const EmployeeListScreen());
                    });
                  }
                  if(state is NewUserFail) {
                    context.pop();
                    showToast(message: 'User Created Fail!');
                  }
                },
                builder: (context, state) {
                  return MainButton(
                    title: 'Create user',
                    onTap: () {
                      if (newUserCubit.newUserFormKey.currentState!.validate()) {
                        newUserCubit.createNewUser(
                          firstName: newUserCubit.firstNameController.text,
                          lastName: newUserCubit.lastNameController.text,
                          gender: newUserCubit.genderController.text,
                          specialist: newUserCubit.specialistController.text,
                          status: newUserCubit.statusController.text,
                          dateOfBirth: newUserCubit.dateOfBirthController.text,
                          phoneNumber: newUserCubit.phoneNumberController.text,
                          email: newUserCubit.emailController.text,
                          address: newUserCubit.addressController.text,
                          password: newUserCubit.passwordController.text,
                          type: newUserCubit.specialistController.text
                              .toLowerCase(),
                        );
                        print(newUserCubit.genderController.text);
                        print(newUserCubit.specialistController.text);
                        print(newUserCubit.statusController.text);
                        print('====================');
                        print(newUserCubit.specialistController.text
                            .toLowerCase());
                      }
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
