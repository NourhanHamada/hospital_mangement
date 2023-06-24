import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'login_lower_section.dart';
import 'login_upper_section.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const LoginUpperSection(),
        SizedBox(
          height: 80.h,
        ),
        const LoginLowerSection(),
      ],
    );
  }
}

