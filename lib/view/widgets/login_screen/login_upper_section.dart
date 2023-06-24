import 'package:flutter/material.dart';
import 'package:hospital_mangement/view/constant/fonts.dart';

import '../../constant/assets.dart';
import '../../constant/color_manager.dart';
import '../../core/custom_text.dart';

class LoginUpperSection extends StatelessWidget {
  const LoginUpperSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Image(
          image: AssetImage(
            logo,
          ),
          width: 120,
        ),
        const SizedBox(
          height: 13,
        ),
        CustomText(
          text: 'Welcome back !',
          fontSize: textFont26,
          fontWeight: FontWeight.w600,
          color: mainColor,
        ),
        CustomText(
          text: 'To Continue, Login Now',
          fontSize: textFont14,
          color: grey,
        ),
      ],
    );
  }
}
