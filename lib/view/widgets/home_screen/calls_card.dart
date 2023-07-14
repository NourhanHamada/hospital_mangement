import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../constant/assets.dart';
import '../../constant/color_manager.dart';
import '../../constant/fonts.dart';
import '../../core/custom_text.dart';

class CallsCard extends StatelessWidget {
  const CallsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 16.sp),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
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
                  text: 'Ebrahim Khaled',
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
                  text: '24 . 4 . 2023',
                  color: black,
                  fontSize: textFont16,
                ),
              ],
            ),
            SizedBox(
              height: 32.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  decoration: BoxDecoration(
                    color: greenButton,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            SvgPicture.asset(
                              done,
                              colorFilter: const ColorFilter.mode(
                                  white, BlendMode.srcIn),
                              fit: BoxFit.scaleDown,
                            ),
                            const Icon(
                              Icons.done,
                              color: white,
                              size: 16,
                            )
                          ],
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        CustomText(text: 'Accept')
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 16.sp,
                ),
                Container(
                  width: 100,
                  decoration: BoxDecoration(
                    color: orangeButton,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            SvgPicture.asset(
                              done,
                              colorFilter: const ColorFilter.mode(
                                  white, BlendMode.srcIn),
                              fit: BoxFit.scaleDown,
                            ),
                            const Icon(
                              Icons.close,
                              color: white,
                              size: 16,
                            )
                          ],
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        CustomText(text: 'Busy')
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
