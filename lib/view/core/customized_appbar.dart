import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../constant/assets.dart';
import '../constant/color_manager.dart';
import '../constant/fonts.dart';
import 'custom_text.dart';

class CustomizedAppBar extends StatefulWidget {
  const CustomizedAppBar({super.key});

  @override
  State<CustomizedAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomizedAppBar>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  void _runAnimation() async {
    for (int i = 0; i < 3; i++) {
      await animationController.forward();
      await animationController.reverse();
    }
  }

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _runAnimation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
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
                    text: 'Ebrahem Elzainy',
                    color: black,
                    fontWeight: FontWeight.w400,
                  ),
                  CustomText(
                    text: 'Specialist, Doctor',
                    color: mainColor,
                    fontSize: textFont14,
                  ),
                ],
              ),
            ],
          ),
          RotationTransition(
            turns: Tween(begin: 0.0, end: -.1)
                .chain(
              CurveTween(curve: Curves.elasticIn),
            )
                .animate(animationController),
            child: SvgPicture.asset(
              notification,
            ),
          ),
        ],
      ),
    );
  }
}