import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hospital_mangement/view/constant/extensions.dart';
import '../../constant/color_manager.dart';
import '../../core/buttons/main_button.dart';
import '../../core/custom_text.dart';
import '../../screens/specialist_screens/medical_measurement_screen.dart';

class RequestCaseDetailsSheet extends StatelessWidget {
  const RequestCaseDetailsSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Wrap(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 160.sp,
                height: 100,
                decoration: BoxDecoration(
                    border: Border.all(color: mainColor, width: 2),
                    borderRadius: BorderRadius.circular(4)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.add,
                      color: mainColor,
                    ),
                    CustomText(
                      text: 'Medical record',
                      color: mainColor,
                      fontSize: 14,
                    ),
                  ],
                ),
              ),
              Container(
                width: ScreenUtil().screenWidth / 2 - 20,
                height: 100,
                decoration: BoxDecoration(
                    border: Border.all(color: mainColor, width: 2),
                    borderRadius: BorderRadius.circular(4)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.add,
                        color: grey600,
                      ),
                      CustomText(
                        text: 'Medical measurement',
                        color: grey600,
                        fontSize: 14,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 150.h,
          ),
          MainButton(
            title: 'Request',
            onTap: () {
              context.push(const MedicalMeasurementScreen(),);
            },
          ),
        ],
      ),
    );
  }
}
