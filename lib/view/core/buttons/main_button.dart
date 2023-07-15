import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hospital_mangement/view/constant/fonts.dart';
import '../../constant/color_manager.dart';
import '../custom_text.dart';
import 'custom_button.dart';

// ignore: must_be_immutable
class MainButton extends StatelessWidget {
  MainButton({
    super.key,
    required this.title,
    required this.onTap,
    this.width,
    this.color
  });

  final String title;
  final void Function()? onTap;
  double? width;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      color: color ?? mainColor,
      onClick: onTap,
      width: width,
      title: CustomText(
        color: whiteColor,
        fontSize: textFont14.sp,
        fontWeight: FontWeight.w400,
        text: title,
      ),
    );
  }
}
