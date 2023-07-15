import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hospital_mangement/view/constant/color_manager.dart';
import 'package:hospital_mangement/view/constant/extensions.dart';
import 'package:hospital_mangement/view/core/buttons/main_button.dart';
import 'package:hospital_mangement/view/core/custom_appbar.dart';
import 'package:hospital_mangement/view/core/custom_text.dart';
import 'package:hospital_mangement/view/core/scaffold_custom/scaffold_custom.dart';
import 'package:hospital_mangement/view/screens/home_screen.dart';
import 'package:hospital_mangement/view/screens/specialist_screens/select_nurse_screen.dart';
import 'package:hospital_mangement/view/widgets/home_screen/calls_card.dart';
import '../../widgets/home_screen/case_details_item.dart';
import '../../widgets/home_screen/request_case_details_sheet.dart';

class CaseDetailsScreen extends StatelessWidget {
  const CaseDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldCustom(
      appBarCustom: CustomAppBar(
        title: 'Case Details',
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            color: mainColor,
                            borderRadius: BorderRadius.circular(2)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          child: CustomText(
                            text: 'Case',
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            color: grey200,
                            borderRadius: BorderRadius.circular(2),
                            border: Border.all(
                              color: grey500,
                            )),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          child: CustomText(
                            text: 'Medical record',
                            fontSize: 12,
                            color: black,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            color: grey200,
                            borderRadius: BorderRadius.circular(2),
                            border: Border.all(
                              color: grey500,
                            )),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          child: Row(
                            children: [
                              CustomText(
                                text: 'Medical measurement',
                                fontSize: 12,
                                color: black,
                              ),
                              SizedBox(
                                width: 3.sp,
                              ),
                              CustomText(
                                text: '•',
                                color: redNote,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 32.h,
                ),
                const CaseDetailsItem(
                  text: 'Patient Name',
                  infoDetails: 'Ebrahim Khaled',
                  isNeedIcon: false,
                ),
                const CaseDetailsItem(
                  text: 'Age',
                  infoDetails: '24 Years',
                  isNeedIcon: false,
                ),
                const CaseDetailsItem(
                  text: 'Phone Number',
                  infoDetails: '01159533995',
                  isNeedIcon: false,
                ),
                const CaseDetailsItem(
                  text: 'Date',
                  infoDetails: '14 . 07 . 2023',
                  isNeedIcon: false,
                ),
                const CaseDetailsItem(
                  text: 'Doctor',
                  infoDetails: 'Salma Ahmed',
                  isNeedIcon: false,
                ),
                const CaseDetailsItem(
                  text: 'Nurse',
                  infoDetails: 'Ali Islam',
                  isNeedIcon: false,
                ),
                const CaseDetailsItem(
                  text: 'Status',
                  infoDetails: 'Process',
                  isNeedIcon: true,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'Case Description',
                      color: grey600,
                      fontWeight: FontWeight.w500,
                    ),
                    CustomText(
                      text:
                          'Details note : Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s ',
                      color: grey900,
                    ),
                  ],
                ),
                SizedBox(
                  height: 32.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SmallButton(
                      text: 'Add Nurse',
                      color: mainColor,
                      icon: Icons.add,
                      iconSize: 24,
                      secondIcon: '',
                      width: ScreenUtil().screenWidth / 3,
                      onTap: () {
                        context.push(SelectNurseScreen());
                      },
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    SmallButton(
                      text: 'Request',
                      color: mainColor,
                      icon: Icons.add,
                      iconSize: 24,
                      secondIcon: '',
                      width: ScreenUtil().screenWidth / 3,
                      onTap: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          )),
                          context: context,
                          builder: (BuildContext context) {
                            return const RequestCaseDetailsSheet();
                          },
                        );
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
          Align(
            alignment: FractionalOffset.bottomCenter,
            child: MainButton(
              onTap: () {
                context.push(const HomeScreen());
              },
              title: 'End Case',
              color: red,
            ),
          ),
        ],
      ),
    );
  }
}