import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant/color_manager.dart';

class CustomCheckbox extends StatelessWidget {
  final bool isChecked;

  const CustomCheckbox({super.key, required this.isChecked});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20.0.w,
      height: 20.0.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0), color: grey300),
      child: isChecked
          ? Icon(
        Icons.check,
        color: mainColor,
        weight: 14.sp,
        size: 14.h,
      )
          : null,
    );
  }
}