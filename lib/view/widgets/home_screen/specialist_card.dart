import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hospital_mangement/view/constant/color_manager.dart';
import 'package:hospital_mangement/view/constant/fonts.dart';
import 'package:hospital_mangement/view/core/custom_text.dart';

class SpecialistCard extends StatelessWidget {
  SpecialistCard({
    super.key,
    required this.cardColor,
    required this.height,
    this.width,
    required this.context,
    required this.isRow,
    required this.text,
    required this.subText,
    this.icon,
    required this.onTap,
  });

  BuildContext context;
  final Color cardColor;
  final double height;
  double? width;
  bool isRow = false;
  final String text;
  final String subText;
  final Widget? icon;
  void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: cardColor,
        ),
        height: height,
        width: width ?? ScreenUtil().screenWidth / 2 - 32,
        child: isRow
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: 48.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: text,
                      color: white,
                    ),
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: white,
                        ),
                      ),
                      child: Center(
                        child: icon,
                      ),
                    ),
                  ],
                ),
              )
            : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: white,
                    ),
                  ),
                  child: Center(
                    child: icon,
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                CustomText(
                  text: text,
                  color: white,
                  fontSize: textFont16,
                ),
                SizedBox(
                  height: 4.h,
                ),
                CustomText(
                  text: subText,
                  color: white,
                  fontSize: textFont12,
                ),
              ],
            ),
      ),
    );
  }
}
