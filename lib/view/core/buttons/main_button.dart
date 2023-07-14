import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constant/color_manager.dart';
import '../custom_text.dart';
import 'custom_button.dart';

// ignore: must_be_immutable
class MainButton extends StatelessWidget {
  MainButton({
    super.key,
    required this.title,
    required this.onTap,
    this.width,
  });

  final String title;
  final void Function()? onTap;
  double? width;

  @override
  Widget build(BuildContext context) {
    // return SizedBox(
    //   width: width ?? ScreenUtil().screenWidth,
    //   child: ElevatedButton(
    //     onPressed: onTap,
    //     style: ElevatedButton.styleFrom(
    //       backgroundColor: mainColor,
    //       shape: RoundedRectangleBorder(
    //         borderRadius: BorderRadius.circular(10)
    //       ),
    //     ),
    //     child: CustomText(
    //       text: title,
    //       fontSize: 12,
    //       fontWeight: FontWeight.w400,
    //       color: white,
    //     ),
    //   ),
    // );

    return Column(
      children: [
        SizedBox(
          width: width ?? ScreenUtil().screenWidth,
          child: ElevatedButton(
            onPressed: (){
              print('HELLO');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: mainColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
            child: CustomText(
              text: title,
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: white,
            ),
          ),
        ),

        //================
        CustomButton(
          color: mainColor,
          onClick: onTap,
          width: width,
          title: CustomText(
            color: whiteColor,
            fontSize: 12,
            fontWeight: FontWeight.w400,
            text: title,
          ),
        ),
      ],
    );
  }
}
