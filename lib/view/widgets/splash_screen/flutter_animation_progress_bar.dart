import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:hospital_mangement/view/constant/extensions.dart';
import 'package:hospital_mangement/view/screens/hr_screens/employee_list_screen.dart';
import 'package:hospital_mangement/view_model/cubit/all_users/all_users_cubit.dart';
import '../../constant/color_manager.dart';
import '../../screens/startup_screens/startup_screen.dart';

class FlutterAnimationProgressBar extends StatefulWidget {
  const FlutterAnimationProgressBar({Key? key}) : super(key: key);

  @override
  State<FlutterAnimationProgressBar> createState() =>
      FlutterAnimationProgressBarState();
}

class FlutterAnimationProgressBarState
    extends State<FlutterAnimationProgressBar> {
  double progressValue = 0;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    AllUsersCubit().get(context).getAllUsers(specialist: 'All');
    timer = Timer.periodic(const Duration(milliseconds: 30), (Timer timer) {
      setState(() {
        if (progressValue == 100) {
          timer.cancel();
          context.push(const StartupScreen());
          // context.push(const EmployeeListScreen());
        } else {
          progressValue++;
        }
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 58),
      child: FAProgressBar(
        backgroundColor: lightGrey,
        progressColor: mainColor,
        size: 4,
        borderRadius: BorderRadius.circular(5),
        currentValue: progressValue,
      ),
    );
  }
}
