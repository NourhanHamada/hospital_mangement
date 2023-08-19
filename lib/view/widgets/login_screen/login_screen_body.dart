import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hospital_mangement/view/constant/extensions.dart';
import 'login_lower_section.dart';
import 'login_upper_section.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: SizedBox(
        height: context.screenHeight,
        child: Column(
          children: [
            const Spacer(flex: 1,),
            const LoginUpperSection(),
            SizedBox(
              height: 80.h,
            ),
            const LoginLowerSection(),
            const Spacer(flex: 1,),
          ],
        ),
      ),
    );
  }
}

