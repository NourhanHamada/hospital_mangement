import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hospital_mangement/view/constant/fonts.dart';
import '../constant/color_manager.dart';
import '../core/custom_text.dart';

class ProfileScreenItem extends StatelessWidget {
  const ProfileScreenItem({
    super.key,
    required this.icon,
    required this.text,
  });

  final String icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 35,
          height: 35,
          color: background,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              icon,
              colorFilter: const ColorFilter.mode(mainColor, BlendMode.srcIn),
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
        SizedBox(
          width: 16.sp,
        ),
        CustomText(
          text: text,
          color: black,
          fontSize: textFont14,
        ),
      ],
    );
  }
}
