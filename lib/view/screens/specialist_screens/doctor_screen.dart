import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hospital_mangement/view/constant/assets.dart';
import 'package:hospital_mangement/view/constant/color_manager.dart';
import 'package:hospital_mangement/view/constant/extensions.dart';
import 'package:hospital_mangement/view/screens/attendance_screens/attendance_screen.dart';
import 'package:hospital_mangement/view/screens/specialist_screens/calls_screen.dart';
import 'package:hospital_mangement/view/screens/report_screens/reports_screen.dart';
import '../../core/customized_appbar.dart';
import '../../widgets/home_screen/specialist_card.dart';
import 'cases_screen.dart';

class DoctorScreen extends StatefulWidget {
  const DoctorScreen({super.key});

  @override
  State<DoctorScreen> createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  void _runAnimation() async {
    for (int i = 0; i < 3; i++) {
      await animationController.forward();
      await animationController.reverse();
    }
  }

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _runAnimation();
    super.initState();
  }

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
                  subText: 'You have +1 Request',
                  icon: Image.asset(
                    calls,
                    width: 24.sp,
                  ),
                  onTap: () {
                    context.push(
                      const CallsScreen(),
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
                  subText: 'You have +1 Request',
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
                  subText: 'You have +1 Request',
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
        SizedBox(
          height: 16.h,
        ),
        //DONE
        SpecialistCard(
          cardColor: brownCard,
          height: 120,
          context: context,
          width: ScreenUtil().screenWidth - 40,
          isRow: true,
          icon: SvgPicture.asset(cases),
          onTap: () {
            context.push(const CasesScreen());
          },
          text: 'Cases',
          subText: '',
        ),
      ],
    );
  }
}
