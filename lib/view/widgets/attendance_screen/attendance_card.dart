import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constant/color_manager.dart';
import '../../constant/fonts.dart';
import '../../core/custom_text.dart';

class AttendanceCard extends StatelessWidget {
  const AttendanceCard({
    super.key,
    required this.text,
    required this.time,
    required this.icon,
    required this.color,
    required this.onPress,
  });

  final String text;
  final String time;
  final Color color;
  final IconData icon;
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: text,
                  color: black,
                ),
                CustomText(
                  text: time,
                  color: mainColor,
                  fontSize: textFont12,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(
                  height: 8.h,
                ),
                Container(
                  width: 65,
                  height: 35,
                  decoration: BoxDecoration(
                    color: mainColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: IconButton(
                      onPressed: onPress,
                      icon: const Icon(
                        Icons.arrow_forward,
                        color: white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: 17,
              height: 17,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: white,
                size: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
