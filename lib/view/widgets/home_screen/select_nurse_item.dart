import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constant/color_manager.dart';
import '../../constant/fonts.dart';
import '../../core/custom_text.dart';

//ignore: must_be_immutable
class SelectNurseItem extends StatelessWidget {
  SelectNurseItem({
    super.key,
    required this.activeOrNot,
    required this.selected,
    required this.name,
    this.onTap,
  });

  final Color activeOrNot;
  late Color selected;
  final String name;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Stack(
                  children: [
                    Container(
                      width: 50.sp,
                      height: 50.sp,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          5,
                        ),
                        color: black,
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        width: 14,
                        height: 14,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: activeOrNot,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 16.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: name,
                      color: black,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                    CustomText(
                      text: 'Specialist, Nurse',
                      color: grey600,
                      fontSize: textFont12,
                    ),
                  ],
                ),
              ],
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 22,
                  height: 22,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: grey400,
                  ),
                ),
                Container(
                  width: 13,
                  height: 13,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: selected,
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