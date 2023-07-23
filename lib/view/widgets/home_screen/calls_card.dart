import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../constant/assets.dart';
import '../../constant/color_manager.dart';
import '../../core/custom_text.dart';
import 'card_upper_case.dart';

class CallsCard extends StatelessWidget {
  const CallsCard({
    super.key,
    required this.name,
    this.date,
  });

  final String name;
  final date;

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
            CardUpperCase(
              name: name,
              date: date,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 SmallButton(
                  text: 'Accept',
                  color: greenButton,
                  icon: Icons.done,
                  secondIcon: done,
                  onTap: (){},
                ),
                SizedBox(
                  width: 16.sp,
                ),
                SmallButton(
                  text: 'Busy',
                  color: orangeButton,
                  icon: Icons.close,
                  secondIcon: done,
                  onTap: (){},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//ignore: must_be_immutable
class SmallButton extends StatelessWidget {
   SmallButton({
    super.key,
    required this.text,
    required this.color,
    required this.icon,
    this.width,
    this.secondIcon,
    required this.onTap,
     this.iconSize,
  });

  final String text;
  final Color color;
  final IconData icon;
  final double? width;
  final String? secondIcon;
  void Function() onTap;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width ?? ScreenUtil().screenWidth / 3.5,
        decoration: BoxDecoration(
          color: color,
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
                    secondIcon!,
                    colorFilter: const ColorFilter.mode(white, BlendMode.srcIn),
                    fit: BoxFit.scaleDown,
                  ),
                  Icon(
                    icon,
                    color: white,
                    size: iconSize ?? 16,
                  )
                ],
              ),
              SizedBox(
                width: 4.w,
              ),
              CustomText(
                text: text,
              )
            ],
          ),
        ),
      ),
    );
  }
}
