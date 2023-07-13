import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hospital_mangement/view/constant/color_manager.dart';
import 'package:hospital_mangement/view/constant/extensions.dart';
import 'package:hospital_mangement/view/constant/fonts.dart';
import 'package:hospital_mangement/view/core/custom_text.dart';
import 'package:hospital_mangement/view/core/scaffold_custom/scaffold_custom.dart';
import 'package:hospital_mangement/view/screens/attendance_screens/touch_id_sensor_screen.dart';
import 'package:hospital_mangement/view_model/cubit/attendance/attendance_cubit.dart';
import '../../core/customized_appbar.dart';
import 'package:intl/date_symbol_data_local.dart';
import '../../widgets/attendance_screen/attendance_card.dart'; //for date locale

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  @override
  void initState() {
    initializeDateFormatting(); // Initial dateFormatter package before Run code.
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AttendanceCubit attendanceCubit = BlocProvider.of(context, listen: true);
    return ScaffoldCustom(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const CustomizedAppBar(),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
                color: simonColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: 'Note',
                        color: orangeRed,
                        fontWeight: FontWeight.w500,
                      ),
                      CustomText(
                        text:
                            'Details note : Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s ',
                        color: black,
                        fontSize: btnFont14,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              AttendanceCard(
                text: 'Attendance',
                time: attendanceCubit.timeAttend,
                icon: attendanceCubit.isAttend ? Icons.done : Icons.close,
                color: attendanceCubit.isAttend ? greenButton : orange,
                onPress: () {
                  context.push(const TouchIdSensorScreen());
                  attendanceCubit.attendanceDone();
                },
              ),
              SizedBox(
                height: 24.h,
              ),
              AttendanceCard(
                text: 'Leaving',
                time: attendanceCubit.timeLeave,
                icon: attendanceCubit.isLeaving ? Icons.done : Icons.close,
                color: attendanceCubit.isLeaving ? greenButton : orange,
                onPress: () {
                  context.push(const TouchIdSensorScreen());
                  attendanceCubit.leavingDone();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
