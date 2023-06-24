import 'package:flutter/material.dart';
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
        Image(image: AssetImage(logo)),
        SizedBox(
          height: 9,
        ),
        CustomText(
          text: 'Hospital System',
          color: mainColor,
          fontSize: textFont20,
        ),
        SizedBox(
          height: 191,
        ),
        FlutterAnimationProgressBar(),
        SizedBox(
          height: 8,
        ),
        AnimatedText(),
      ],
    );
  }
}
