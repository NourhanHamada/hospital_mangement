// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../../constant/color_manager.dart';
//
// // ignore: must_be_immutable
// class TextFormFieldsCustom extends StatefulWidget {
//   final String? hintText;
//   final int? maxLines;
//   final String? Function(String?)? validator;
//   final Function(String?)? onSaved;
//   bool? isPassword;
//   final TextInputType? keyboardType;
//   final String? helperText;
//   final String initialValue;
//   final Function()? onEditingComplete;
//   final TextInputAction? textInputAction;
//   final TextEditingController? controller;
//   final bool? suffix;
//   final bool? suffixToggle;
//   final Widget? suffixIcon;
//   final Color? suffixIconColor;
//   final IconData? suffixIconToggle;
//   final Color? suffixIconColorToggle;
//   final Function()? suffixOnPressed;
//   final FocusNode? focus;
//   final Function(String?)? onChanged;
//   final bool? enableInteractive;
//   final Widget? prefixIcon;
//
//   TextFormFieldsCustom(
//       {Key? key,
//       this.hintText,
//       this.validator,
//       this.onSaved,
//       this.maxLines = 1,
//       this.keyboardType,
//       this.helperText,
//       this.isPassword = false,
//       this.initialValue = "",
//       this.onEditingComplete,
//       this.textInputAction,
//       this.controller,
//       this.suffix = false,
//       this.suffixToggle = false,
//       this.suffixIcon,
//       this.suffixIconColor = hintColor,
//       this.suffixIconToggle,
//       this.suffixIconColorToggle = hintColor,
//       this.suffixOnPressed,
//       this.focus,
//       this.onChanged,
//       this.enableInteractive = true,
//       this.prefixIcon})
//       : super(key: key);
//
//   @override
//   State<TextFormFieldsCustom> createState() => _TextFormFieldsCustomState();
// }
//
// class _TextFormFieldsCustomState extends State<TextFormFieldsCustom> {
//   //const TextFormFieldsCustom({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       enableInteractiveSelection: widget.enableInteractive,
//       controller: widget.controller,
//       focusNode: widget.focus,
//       maxLines: widget.maxLines,
//       textInputAction: widget.textInputAction ?? TextInputAction.done,
//       onEditingComplete: widget.onEditingComplete,
//       onChanged: (value) {
//         //onChanged!(value);
//         widget.onChanged != null ? widget.onChanged!(value) : null;
//       },
//       style: const TextStyle(
//         color: white
//       ),
//       decoration: InputDecoration(
//         fillColor: toastColor,
//         filled: true,
//         isDense: true,
//         hintText: widget.hintText,
//         helperText: widget.helperText,
//         suffixIcon: widget.suffixIcon,
//         prefixIcon: widget.prefixIcon,
//         floatingLabelBehavior: FloatingLabelBehavior.auto,
//         hintStyle: TextStyle(
//           fontSize: 14.sp,
//           color: greyText,
//         ),
//         // enabledBorder: const OutlineInputBorder(
//         //   borderSide: BorderSide(
//         //     color: fillGrey,
//         //   ),
//         // ),
//         contentPadding: EdgeInsets.symmetric(
//           vertical: 16.sp,
//           horizontal: 18.sp,
//         ),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10)
//         ),
//         focusedBorder:  OutlineInputBorder(
//           borderSide: const BorderSide(
//             color: toastColor,
//           ),
//           borderRadius: BorderRadius.circular(10)
//         ),
//         errorBorder: const OutlineInputBorder(
//           borderSide: BorderSide(
//             color: Colors.red,
//           ),
//         ),
//         focusedErrorBorder: const OutlineInputBorder(
//           borderSide: BorderSide(
//             color: Colors.red,
//           ),
//         ),
//       ),
//       obscureText: widget.isPassword!,
//       validator: widget.validator,
//       onSaved: (value) {
//         widget.onSaved != null ? widget.onSaved!(value) : null;
//       },
//       keyboardType: widget.keyboardType,
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hospital_mangement/view/constant/fonts.dart';

import '../../../view_model/cubit/theme/theme_cubit.dart';
import '../../constant/color_manager.dart';
import '../custom_text.dart';

// ignore: must_be_immutable
class TextFormFieldsCustom extends StatefulWidget {
  final String? hintText;
  final String? Function(String?)? validator;
  final Function(String?)? onSaved;
  bool? isPassword;
  final TextInputType? keyboardType;
  final String? helperText;
  final String initialValue;
  final Function()? onEditingComplete;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final bool? suffix;
  final bool? suffixToggle;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? suffixIconColor;
  final IconData? suffixIconToggle;
  final Color? suffixIconColorToggle;
  final Function()? suffixOnPressed;
  final Function()? onTap;
  final FocusNode? focus;
  final Function(String?)? onChanged;
  final String? labelText;
  final List<TextInputFormatter>? inputFormatter;
  final int? maxLines;
  final Color? labelDividerColor;

  TextFormFieldsCustom({
    Key? key,
    this.prefixIcon,
    this.hintText,
    this.validator,
    this.onSaved,
    this.keyboardType,
    this.helperText,
    this.isPassword = false,
    this.initialValue = "",
    this.onEditingComplete,
    this.textInputAction,
    this.controller,
    this.suffix = false,
    this.suffixToggle = false,
    this.suffixIcon,
    this.suffixIconColor = hintColor,
    this.suffixIconToggle,
    this.suffixIconColorToggle = hintColor,
    this.suffixOnPressed,
    this.focus,
    this.onChanged,
    required bool enableInteractive,
    this.labelText,
    this.onTap,
    this.inputFormatter,
    this.maxLines,
    this.labelDividerColor
  }) : super(key: key);

  @override
  State<TextFormFieldsCustom> createState() => _TextFormFieldsCustomState();
}

class _TextFormFieldsCustomState extends State<TextFormFieldsCustom> {
  // const TextFormFieldsCustom({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      maxLines: widget.maxLines ?? 1,
      focusNode: widget.focus,
      inputFormatters: widget.inputFormatter,
      textInputAction: widget.textInputAction ?? TextInputAction.done,
      onEditingComplete: widget.onEditingComplete,
      onChanged: (value) {
        // onChanged!(value);
        // widget.onChanged != null ? widget.onChanged!(value) : null;
      },
      onTap: widget.onTap,
      style: const TextStyle(color: grey800),
      cursorColor: mainColor,
      cursorHeight: 20,
      cursorWidth: 1.5,
      decoration: InputDecoration(
        // label:  CustomText(
        //   text: '${widget.labelText}',
        //   color: grey700,
        //   fontWeight: FontWeight.w400,
        //   fontSize: textFont12,
        // ),
        label: Row(
          children: [
            Container(
              width: 1.2,
              height: 20,
              color: widget.labelDividerColor ?? Colors.transparent,
            ),
            const SizedBox(
              width: 8,
            ),
            CustomText(
              text: '${widget.labelText}',
              color: grey700,
              fontWeight: FontWeight.w400,
              fontSize: textFont12,
            ),
          ],
        ),
        fillColor: ThemeCubit.get(context).isDark ? toastColor : white,
        filled: true,
        isDense: true,
        hintText: widget.labelText,
        helperText: widget.helperText,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        errorStyle: const TextStyle(
            color: orangeRed, fontSize: 15, fontWeight: FontWeight.w500),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        hintStyle: const TextStyle(
          fontSize: 15,
          color: grey600,
        ),
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
      obscureText: widget.isPassword!,
      obscuringCharacter: '*',
      validator: widget.validator,
      onSaved: (value) {
        // widget.onSaved != null ? widget.onSaved!(value) : null;
      },
      keyboardType: widget.keyboardType,
    );
  }
}
