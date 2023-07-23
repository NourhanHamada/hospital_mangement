import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hospital_mangement/view/constant/color_manager.dart';
import 'package:hospital_mangement/view/constant/extensions.dart';
import 'package:hospital_mangement/view/core/buttons/main_button.dart';
import 'package:hospital_mangement/view/core/custom_text.dart';
import 'package:hospital_mangement/view/core/scaffold_custom/scaffold_custom.dart';
import '../../../view_model/cubit/report/report_cubit.dart';
import '../../core/custom_appbar.dart';
import '../../widgets/customized_appbar_left_section.dart';

class ReportDetailsScreen extends StatelessWidget {
  const ReportDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ReportCubit reportCubit =
        BlocProvider.of<ReportCubit>(context, listen: true);
    return ScaffoldCustom(
      appBarCustom: CustomAppBar(
        title: 'Report Details',
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: grey400.withOpacity(.6),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 6, horizontal: 10),
                          child: CustomText(
                            text: 'Report Name',
                            color: black,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: red, borderRadius: BorderRadius.circular(4)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 6, horizontal: 8),
                        child: CustomText(
                          text: 'End',
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 32.h,
                ),
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
                SizedBox(
                  height: 8.h,
                ),
                reportCubit.selectedImage != null
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.file(
                              reportCubit.selectedImage!,
                              width: context.screenWidth / 2,
                            ),
                          ),
                        ],
                      )
                    : CustomText(text: 'Please Select an Image'),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.replay_sharp,
                          color: grey600,
                          size: 16,
                        ),
                        CustomText(
                          text: 'Replay - Manager',
                          color: grey600,
                          fontSize: 10,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
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
                  ],
                ),
              ],
            ),
          ),
          TextFormField(
            cursorHeight: 20,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                hintText: 'Type your Replay',
                hintStyle: const TextStyle(color: grey600),
                suffixIcon: const Icon(
                  Icons.upload,
                  color: grey600,
                ),
                filled: true,
                fillColor: grey300,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none)),
          ),
          SizedBox(
            height: 16.h,
          ),
          MainButton(
            title: 'Send',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
