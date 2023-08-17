import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hospital_mangement/view/constant/extensions.dart';
import 'package:hospital_mangement/view/screens/receptionist_screens/receptioninst_calls_screen.dart';
import '../../constant/assets.dart';
import '../../constant/color_manager.dart';
import '../../core/customized_appbar.dart';
import '../../widgets/home_screen/specialist_card.dart';
import '../attendance_screens/attendance_screen.dart';
import '../report_screens/reports_screen.dart';

class ReceptionistScreen extends StatelessWidget {
  const ReceptionistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomizedAppBar(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                //DONE
                SpecialistCard(
                  cardColor: blueCard,
                  context: context,
                  height: 175.h,
                  isRow: false,
                  text: 'Calls',
                  subText: '',
                  icon: Image.asset(
                    calls,
                    width: 24.sp,
                  ),
                  onTap: () {
                    context.push(
                      const ReceptionistCallsScreen(),
                    );
                  },
                ),
                SizedBox(
                  height: 16.h,
                ),
                // IN PROGRESS
                SpecialistCard(
                  cardColor: mauveCard,
                  context: context,
                  height: 140.h,
                  isRow: false,
                  onTap: () {
                    context.push(const ReportsScreen());
                  },
                  text: 'Reports',
                  subText: '',
                  icon: Image.asset(
                    document,
                    width: 24.sp,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                //todo: tasks screen
                SpecialistCard(
                  cardColor: greenCard,
                  context: context,
                  height: 140.h,
                  isRow: false,
                  onTap: () {},
                  text: 'Tasks',
                  subText: '',
                  icon: Image.asset(
                    tasks,
                    width: 24.sp,
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                //DONE
                SpecialistCard(
                  cardColor: lightBlueCard,
                  context: context,
                  height: 175.h,
                  isRow: false,
                  onTap: () {
                    context.push(const AttendanceScreen());
                  },
                  text: 'attendance - leaving',
                  subText: '',
                  icon: Image.asset(
                    fingerPrintIcon,
                    width: 24.sp,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
