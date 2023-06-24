import 'package:flutter/material.dart';

import '../constant/color_manager.dart';


class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    Key? key,
    required this.prefixIcon,
    this.suffixIcon,
    required this.labelText,
    required this.textInputType,
    required this.obscureText,
    // required this.controller,
    this.validator,
    this.onChanged,
    this.onSaved,
  }) : super(key: key);

  // final TextEditingController controller;
  final Widget prefixIcon;
  final Widget? suffixIcon;
  final String labelText;
  final TextInputType textInputType;
  final bool obscureText;
  String? Function(String)? validator;
  void Function(String)? onChanged;
  void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // controller: controller,
      obscureText: obscureText,
      keyboardType: textInputType,
      cursorColor: grey,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: lightGrey,
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
          prefixIcon: prefixIcon,
          label: Row(
            children: [
              Container(
                width: 1.2,
                height: 22,
                color: mainColor,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                labelText,
                // style: MyStyles.textStyle14.copyWith(color: grey),
              ),
            ],
          ),
          suffixIcon: suffixIcon),
    );
  }
}
