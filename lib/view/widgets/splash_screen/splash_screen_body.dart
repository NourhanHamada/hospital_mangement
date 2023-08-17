import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hospital_mangement/view/constant/fonts.dart';
import '../../constant/assets.dart';
import '../../constant/color_manager.dart';
import '../../core/custom_text.dart';
import 'animated_text.dart';
import 'flutter_animation_progress_bar.dart';

class SplashScreenBody extends StatelessWidget {
  const SplashScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children:  [
        const Image(image: AssetImage(logo),),
        SizedBox(
          height: 9.h,
        ),
        CustomText(
          text: 'Hospital System',
          color: mainColor,
          fontSize: textFont20,
        ),
        const SizedBox(
          height: 191,
        ),
        const FlutterAnimationProgressBar(),
        const SizedBox(
          height: 8,
        ),
        const AnimatedText(),
      ],
    );
  }
}
