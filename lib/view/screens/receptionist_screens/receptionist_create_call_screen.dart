import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_mangement/view/constant/color_manager.dart';
import 'package:hospital_mangement/view/constant/data.dart';
import 'package:hospital_mangement/view/constant/extensions.dart';
import 'package:hospital_mangement/view/core/buttons/main_button.dart';
import 'package:hospital_mangement/view/core/component.dart';
import 'package:hospital_mangement/view/core/custom_appbar.dart';
import 'package:hospital_mangement/view/core/textfields/custom_text_form_filed.dart';
import 'package:hospital_mangement/view/screens/receptionist_screens/select_doctor_screen.dart';
import 'package:hospital_mangement/view_model/cubit/create_call/create_call_cubit.dart';
import '../../core/scaffold_custom/scaffold_custom.dart';

class ReceptionistCreateCallScreen extends StatefulWidget {
  const ReceptionistCreateCallScreen({super.key});

  @override
  State<ReceptionistCreateCallScreen> createState() =>
      _ReceptionistCreateCallScreenState();
}

class _ReceptionistCreateCallScreenState
    extends State<ReceptionistCreateCallScreen> {
  List<String> doctors = [
    'Hazim',
    'Mohammed',
    'Hossam',
  ];

  @override
  Widget build(BuildContext context) {
    CreateCallCubit createCallCubit = BlocProvider.of(
      context,
      listen: true,
    );
    return ScaffoldCustom(
      appBarCustom: CustomAppBar(
        title: 'Create Call',
      ),
      body: Column(
        children: [
          Expanded(
            child: Form(
              key: createCallCubit.callFormKey,
              child: Column(
                children: [
                  TextFormFieldsCustom(
                    enableInteractive: false,
                    controller: createCallCubit.patientNameController,
                    labelText: 'Patient Name',
                    onChanged: (value) {
                      createCallCubit.patientNameController.text = value!;
                    },
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return 'Patient Name must be not empty';
                      } else if (!RegExp(validationName)
                          .hasMatch(value.trim())) {
                        return 'Patient Name is not valid';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextFormFieldsCustom(
                    inputFormatter: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(2),
                    ],
                    enableInteractive: false,
                    controller: createCallCubit.patientAgeController,
                    labelText: 'Patient Age',
                    onChanged: (value) {
                      createCallCubit.patientAgeController.text = value!;
                    },
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return "Patient Age must be not empty";
                      }
                      return null;
                    },
                    // onTap: () {
                    //   print('HELLO');
                    //   showModalBottomSheet(
                    //     context: context,
                    //     isScrollControlled: true,
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(20),
                    //     ),
                    //     builder: (BuildContext context) {
                    //       return Padding(
                    //         padding: const EdgeInsets.all(8),
                    //         child: NumberPicker(
                    //           minValue: 1,
                    //           maxValue: 100,
                    //           value: createCallCubit.defaultValue,
                    //           step: 1,
                    //           onChanged: (value) {
                    //             print('CHANGED!!');
                    //             setState(
                    //                   () {
                    //                     createCallCubit.defaultValue = value;
                    //                     createCallCubit.patientAgeController.text = createCallCubit.defaultValue.toString();
                    //                 createCallCubit.patientAgeController.text = value.toString();
                    //                 print(value);
                    //                 print(createCallCubit.defaultValue);
                    //                 print(createCallCubit.patientAgeController);
                    //               },
                    //             );
                    //           },
                    //         ),
                    //       );
                    //     },
                    //   );
                    // },
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextFormFieldsCustom(
                    enableInteractive: false,
                    inputFormatter: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    controller: createCallCubit.patientPhoneNumberController,
                    labelText: 'Phone Number',
                    onChanged: (value) {
                      createCallCubit.patientPhoneNumberController.text =
                          value!;
                    },
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
                    height: 24,
                  ),
                  // DropdownButtonFormField2<String>(
                  //   value:
                  //       createCallCubit.selectDoctorController.text.isNotEmpty
                  //           ? createCallCubit.selectDoctorController.text
                  //           : null,
                  //   isExpanded: true,
                  //   decoration: InputDecoration(
                  //     fillColor: white,
                  //     filled: true,
                  //     isDense: true,
                  //     errorStyle: const TextStyle(
                  //         color: orangeRed,
                  //         fontSize: 12,
                  //         fontWeight: FontWeight.w500),
                  //     floatingLabelBehavior: FloatingLabelBehavior.auto,
                  //     border: OutlineInputBorder(
                  //       borderSide: const BorderSide(
                  //         color: grey400,
                  //         width: 1,
                  //       ),
                  //       borderRadius: BorderRadius.circular(
                  //         10,
                  //       ),
                  //     ),
                  //     focusedBorder: OutlineInputBorder(
                  //         borderSide: const BorderSide(
                  //           color: mainColor,
                  //           width: 2,
                  //         ),
                  //         borderRadius: BorderRadius.circular(10)),
                  //     enabledBorder: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(10),
                  //       borderSide: const BorderSide(
                  //         color: grey400,
                  //       ),
                  //     ),
                  //     contentPadding: const EdgeInsets.symmetric(
                  //       vertical: 10,
                  //       horizontal: 16,
                  //     ),
                  //     errorBorder: OutlineInputBorder(
                  //         borderSide: const BorderSide(
                  //           color: Colors.red,
                  //           // color: Colors.transparent,
                  //         ),
                  //         borderRadius: BorderRadius.circular(10)),
                  //     focusedErrorBorder: OutlineInputBorder(
                  //         borderSide: const BorderSide(
                  //           color: Colors.red,
                  //           // color: Colors.transparent,
                  //         ),
                  //         borderRadius: BorderRadius.circular(10)),
                  //   ),
                  //   hint: const Text(
                  //     'Select Doctor',
                  //     style: TextStyle(
                  //       fontSize: 15,
                  //       color: grey800,
                  //     ),
                  //   ),
                  //   style: const TextStyle(color: darkBackground),
                  //   items: doctors
                  //       .map(
                  //         (item) => DropdownMenuItem<String>(
                  //           value: item,
                  //           child: Text(
                  //             item,
                  //             style: const TextStyle(
                  //               fontSize: 14,
                  //             ),
                  //           ),
                  //         ),
                  //       )
                  //       .toList(),
                  //   validator: (value) {
                  //     if (value == null) {
                  //       return 'Please select Doctor.';
                  //     }
                  //     return null;
                  //   },
                  //   onChanged: (value) {
                  //     createCallCubit.selectDoctorController.text =
                  //         value!.toString();
                  //   },
                  //   onSaved: (value) {
                  //     // selectedValue = value.toString();
                  //     // userInsertedField = value!.toString();
                  //   },
                  //   buttonStyleData: const ButtonStyleData(
                  //       // padding: EdgeInsets.only(right: 8),
                  //       ),
                  //   iconStyleData: const IconStyleData(
                  //     icon: Icon(
                  //       Icons.arrow_drop_down,
                  //       color: grey600,
                  //     ),
                  //     iconSize: 24,
                  //   ),
                  //   dropdownStyleData: DropdownStyleData(
                  //     maxHeight: context.screenHeight / 4,
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(15),
                  //       color: white,
                  //     ),
                  //   ),
                  //   menuItemStyleData: const MenuItemStyleData(
                  //     padding: EdgeInsets.only(left: 8),
                  //   ),
                  // ),
                  TextFormFieldsCustom(
                    enableInteractive: false,
                    controller: createCallCubit.selectDoctorController,
                    labelText: 'Select Doctor',
                    onChanged: (value) {
                      createCallCubit.selectDoctorController.text = value!;
                    },
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return 'Doctor must be not empty';
                      }
                      return null;
                    },
                    suffixIcon: const Icon(Icons.arrow_right, size: 30,),
                    onTap: (){
                      context.push(const SelectDoctorScreen());
                    },
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextFormField(
                    maxLines: 4,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: grey600,
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
                      hintText: 'Case Description',
                    ),
                    controller: createCallCubit.caseDescriptionController,
                    onChanged: (value) {
                      // createCallCubit.caseDescriptionController.text = value!;
                    },
                    // validator: (value) {
                    //   if (value!.trim().isEmpty) {
                    //     return 'Description must be not empty';
                    //   } else if (!RegExp(validationName)
                    //       .hasMatch(value.trim())) {
                    //     return 'Description is not valid';
                    //   }
                    // },
                  ),
                ],
              ),
            ),
          ),
          MainButton(
            title: 'Send Call',
            onTap: () {
              if (createCallCubit.callFormKey.currentState!.validate()) {
                showToast(
                  message: 'Call Sent Successfully',
                  color: toastColor,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
