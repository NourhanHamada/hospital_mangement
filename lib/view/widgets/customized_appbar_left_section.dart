import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hospital_mangement/view/constant/extensions.dart';
import '../constant/color_manager.dart';
import '../constant/fonts.dart';
import '../core/custom_text.dart';
import '../screens/profile_screen.dart';

class CustomizedAppbarLeftSection extends StatelessWidget {
  const CustomizedAppbarLeftSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        context.push(const ProfileScreen());
      },
      child: Row(
        children: [
          Container(
            width: 35.sp,
            height: 35.sp,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                5,
              ),
              color: mainColor,
            ),
          ),
          SizedBox(
            width: 8.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: 'Ebrahim Khaled',
                color: black,
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
              CustomText(
                text: 'Specialist, Doctor',
                color: mainColor,
                fontSize: textFont12,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
