import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../constant/assets.dart';
import '../constant/color_manager.dart';
import '../core/custom_text.dart';

class TasksAndReportsCard extends StatelessWidget {
  const TasksAndReportsCard({super.key, this.onTap, required this.taskName, required this.date, required this.process});

  final Function()? onTap;
  final String taskName, date, process;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                          color: mainColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Image.asset(
                            document,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8.h,
                      ),
                      CustomText(
                        text: taskName,
                        color: black,
                        fontSize: 14,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                          color: mainColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: SvgPicture.asset(
                          calendar,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      SizedBox(
                        width: 8.h,
                      ),
                      CustomText(
                        text: date,
                        color: black,
                        fontSize: 14,
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  color: process == 'Finished' ? greenBackground : orangeBackground,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: CustomText(
                    text: process,
                    color: process == 'Finished' ? greenText : orangeText,
                    fontSize: 10,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

