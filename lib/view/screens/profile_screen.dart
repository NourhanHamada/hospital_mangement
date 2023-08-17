import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hospital_mangement/view/core/custom_appbar.dart';
import 'package:hospital_mangement/view/core/custom_text.dart';
import 'package:hospital_mangement/view/core/scaffold_custom/scaffold_custom.dart';
import '../constant/assets.dart';
import '../constant/color_manager.dart';
import '../widgets/profile_screen_item.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldCustom(
      appBarCustom: CustomAppBar(
        title: 'My profile',
        colorTxtAppBar: white,
      ),
      background: mainColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: ScreenUtil().screenHeight / 1.5,
            width: ScreenUtil().screenWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: white,
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 75, left: 16, right: 16, bottom: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: CustomText(
                          text: 'Ebrahim Khaled',
                          color: mainColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const ProfileScreenItem(
                        text: 'Specialist - Doctor',
                        icon: specialist,
                      ),
                      const ProfileScreenItem(
                        text: 'Male',
                        icon: gender,
                      ),
                      const ProfileScreenItem(
                        text: '29 - 3 - 1996',
                        icon: calendar,
                      ),
                      const ProfileScreenItem(
                        text: 'Mansoura',
                        icon: location,
                      ),
                      const ProfileScreenItem(
                        text: 'Single',
                        icon: heart,
                      ),
                      const ProfileScreenItem(
                        text: 'ebrahim.k@gmail.com',
                        icon: heart,
                      ),
                      const ProfileScreenItem(
                        text: '01013654378',
                        icon: phone,
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Transform.translate(
                      offset: Offset(ScreenUtil().screenWidth / 2 - 80, -50),
                      // alignment: Alignment.topCenter,
                      child: Container(
                        width: 125,
                        height: 125,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: grey200.withOpacity(.3),
                          border: Border.all(color: mainColor, width: 3),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(13),
                          child: Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: SvgPicture.asset(
                              profileScreen,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
