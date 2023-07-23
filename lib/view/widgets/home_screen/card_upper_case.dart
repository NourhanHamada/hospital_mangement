import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../constant/assets.dart';
import '../../constant/color_manager.dart';
import '../../constant/fonts.dart';
import '../../core/custom_text.dart';

class CardUpperCase extends StatelessWidget {
  const CardUpperCase({super.key, required this.name, required this.date, this.iconBackground,});

  final String name;
  final String date;
  final Color? iconBackground;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  5,
                ),
                color: iconBackground ?? mainColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: SvgPicture.asset(
                  user2,
                  colorFilter:
                  const ColorFilter.mode(white, BlendMode.srcIn),
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
            SizedBox(
              width: 16.sp,
            ),
            CustomText(
              text: name,
              color: black,
              fontSize: textFont16,
            ),
          ],
        ),
        SizedBox(
          height: 16.sp,
        ),
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  5,
                ),
                color: mainColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: SvgPicture.asset(
                  calendar,
                  colorFilter:
                  const ColorFilter.mode(white, BlendMode.srcIn),
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
            SizedBox(
              width: 16.sp,
            ),
            CustomText(
              text: date,
              color: black,
              fontSize: textFont16,
            ),
          ],
        ),
        SizedBox(
          height: 32.h,
        ),
      ],
    );
  }
}
