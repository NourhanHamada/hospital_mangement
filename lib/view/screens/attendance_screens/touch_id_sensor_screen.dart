import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hospital_mangement/view/constant/assets.dart';
import 'package:hospital_mangement/view/constant/color_manager.dart';
import 'package:hospital_mangement/view/constant/extensions.dart';
import 'package:hospital_mangement/view/core/custom_text.dart';

class TouchIdSensorScreen extends StatefulWidget {
  const TouchIdSensorScreen({super.key});

  @override
  State<TouchIdSensorScreen> createState() => _TouchIdSensorScreenState();
}

class _TouchIdSensorScreenState extends State<TouchIdSensorScreen> {

  String text = 'Please touch ID sensor to verify registration';
  final String text2 = 'Your attendance has been registered';
  bool isAttend = false;
  bool isVisible = false;
  bool isAttendance = false;

  @override
  Widget build(BuildContext context) {
    // AttendanceCubit attendanceCubit = BlocProvider.of(context, listen: true);
    return Scaffold(
        backgroundColor: mainColor,
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isAttend = !isAttend;
                        isVisible = true;
                        text = text2;
                        isAttendance = true;
                      });
                    },
                    child: AnimatedSwitcher(
                      duration: const Duration(seconds: 2),
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                        return FadeTransition(
                          opacity: animation,
                          child: child,
                        );
                      },
                      child: isAttendance
                          ? SizedBox(
                        height: 155,
                        width: 155,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: mainColor,
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(color: white, width: 2),
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                          onPressed: () {},
                          child: SvgPicture.asset(
                            checked,
                            key: const ValueKey<String>(checked),
                            // width: 20,
                          ),
                        ),
                      )
                          :  SizedBox(
                        height: 155,
                            child: SvgPicture.asset(
                        fingerPrint,
                        key: const ValueKey<String>(fingerPrint),
                      ),
                          ),
                    ),
                  ),
                  SizedBox(
                    height: 48.h,
                  ),
                  SizedBox(
                    width: context.screenWidth - 44,
                    child: AnimatedAlign(
                      alignment: isAttend == false
                          ? Alignment.centerLeft
                          : Alignment.center,
                      duration: const Duration(seconds: 2),
                      child: AnimatedSwitcher(
                        duration: const Duration(seconds: 2),
                        transitionBuilder:
                            (Widget child, Animation<double> animation) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                        child: CustomText(
                          text: text,
                          key: ValueKey<String>(text),
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 150.h),
              child: AnimatedOpacity(
                opacity: isVisible ? 1.0 : 0.0,
                duration: const Duration(seconds: 2),
                child: SizedBox(
                  height: 55,
                  width: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: mainColor,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: white, width: 2),
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    onPressed: () {
                      // context.push();
                    },
                    child: SvgPicture.asset(
                      arrow,
                      width: 20,
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SvgPicture.asset(
                bottom,
                width: context.screenWidth,
              ),
            ),
          ],
        ));
  }
}
