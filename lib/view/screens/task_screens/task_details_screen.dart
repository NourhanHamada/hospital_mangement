import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hospital_mangement/view/constant/color_manager.dart';
import 'package:hospital_mangement/view/constant/extensions.dart';
import 'package:hospital_mangement/view/core/buttons/main_button.dart';
import 'package:hospital_mangement/view/core/scaffold_custom/scaffold_custom.dart';
import '../../core/custom_appbar.dart';
import '../../core/custom_text.dart';
import '../../widgets/customized_appbar_left_section.dart';

class TaskDetailsScreen extends StatelessWidget {
  const TaskDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldCustom(
      appBarCustom: CustomAppBar(
        title: 'Tasks Details',
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: context.screenWidth,
                  decoration: BoxDecoration(
                    color: grey400.withOpacity(.6),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                    child: CustomText(
                      text: 'Task Name',
                      color: black,
                      fontSize: 14,
                    ),
                  ),
                ),
                SizedBox(
                  height: 32.h,
                ),
                Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        color: grey500,
                        // width: .7,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const CustomizedAppbarLeftSection(),
                            CustomText(
                              text: '13 Mar 2020',
                              color: grey600,
                              fontSize: 12,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        CustomText(
                          text:
                              'Details note : Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s ',
                          color: black,
                          fontSize: 12,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                // DottedBorder(
                //   strokeWidth: 1,
                //   borderType: BorderType.RRect,
                //   // strokeCap: StrokeCap.butt,
                //   dashPattern: const [8, 5],
                //   color: grey500,
                //   child: Column(
                //     children: [
                //       CustomText(text: 'HELLO', color: mainColor,),
                //       CustomText(text: 'HELLO', color: mainColor,),
                //       CustomText(text: 'HELLO', color: mainColor,),
                //       CustomText(text: 'HELLO', color: mainColor,),
                //       CustomText(text: 'HELLO', color: mainColor,),
                //     ],
                //   ),
                // ),
                Container(
                  decoration: const BoxDecoration(
                    border: Border(left: BorderSide()),
                  ),
                ),
              ],
            ),
          ),
          TextFormField(
            textAlign: TextAlign.start,
            maxLines: 3,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                filled: true,
                fillColor: grey300,
                hintText: 'Add Note',
                hintStyle: const TextStyle(
                  color: grey600,
                )),
          ),
          SizedBox(
            height: 16.h,
          ),
          MainButton(title: 'Execution', onTap: () {})
        ],
      ),
    );
  }
}
