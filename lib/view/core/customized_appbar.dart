import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hospital_mangement/view/widgets/customized_appbar_left_section.dart';
import '../constant/assets.dart';

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
      padding: EdgeInsets.symmetric(vertical: 25.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CustomizedAppbarLeftSection(),
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