import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hospital_mangement/view/constant/color_manager.dart';
import 'package:hospital_mangement/view/constant/extensions.dart';
import 'package:hospital_mangement/view/core/custom_appbar.dart';
import 'package:hospital_mangement/view/core/custom_text.dart';
import 'package:hospital_mangement/view/core/scaffold_custom/scaffold_custom.dart';
import 'package:hospital_mangement/view/screens/report_screens/report_details_screen.dart';
import '../../constant/assets.dart';
import 'create_report_screen.dart';

// ignore: must_be_immutable
class ReportsScreen extends StatefulWidget {
  const ReportsScreen({super.key});

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    DateTime selectedDate;
    Future<void> selectDate() async {
      DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime(2024),
      );
      if (picked != null) {
        setState(() {
          selectedDate = picked;
          dateController.text =
              DateFormat('dd . MM . yyyy').format(selectedDate);
        });
      }
    }

    return ScaffoldCustom(
      appBarCustom: CustomAppBar(
        title: 'Reports',
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: grey400),
                    ),
                    // hintText: 'Date',
                    hintText:
                        DateFormat('dd . MM . yyyy').format(DateTime.now()),
                    hintStyle: const TextStyle(
                      color: black,
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: grey400),
                    ),
                    suffixIcon: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(4),
                          bottomRight: Radius.circular(4),
                        ),
                        color: grey900,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: SvgPicture.asset(
                          calendar,
                        ),
                      ),
                    ),
                  ),
                  readOnly: true,
                  onTap: () {
                    selectDate();
                  },
                  controller: dateController,
                ),
              ),
              SizedBox(
                width: 10.sp,
              ),
              Container(
                decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: IconButton(
                  onPressed: () {
                    context.push(CreateReportScreen());
                  },
                  icon: const Icon(
                    Icons.add,
                    color: white,
                    size: 32,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16.h,
          ),
          GestureDetector(
            onTap: (){
              context.push(const ReportDetailsScreen());
            },
            child: Card(
              elevation: 0,
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
                                child: Image.asset(document,),
                              ),
                            ),
                            SizedBox(
                              width: 8.h,
                            ),
                            CustomText(
                              text: 'Report Name',
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
                              child: SvgPicture.asset(calendar, fit: BoxFit.scaleDown,),
                            ),
                            SizedBox(
                              width: 8.h,
                            ),
                            CustomText(
                              text: '24 . 5 . 2023',
                              color: black,
                              fontSize: 14,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: greenBackground
                        , borderRadius: BorderRadius.circular(4),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: CustomText(
                          text: 'Finished',
                          color: greenText,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Card(
            elevation: 0,
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
                              child: Image.asset(document,),
                            ),
                          ),
                          SizedBox(
                            width: 8.h,
                          ),
                          CustomText(
                            text: 'Report Name',
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
                            child: SvgPicture.asset(calendar, fit: BoxFit.scaleDown,),
                          ),
                          SizedBox(
                            width: 8.h,
                          ),
                          CustomText(
                            text: '24 . 5 . 2023',
                            color: black,
                            fontSize: 14,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: orangeBackground
                      , borderRadius: BorderRadius.circular(4),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: CustomText(
                        text: 'Finished',
                        color: orangeText,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
