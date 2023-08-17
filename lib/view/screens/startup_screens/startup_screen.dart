import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hospital_mangement/view/constant/color_manager.dart';
import 'package:hospital_mangement/view/constant/extensions.dart';
import 'package:hospital_mangement/view/constant/fonts.dart';
import 'package:hospital_mangement/view/core/custom_text.dart';
import 'package:hospital_mangement/view/core/scaffold_custom/background_scaffold.dart';
import 'package:hospital_mangement/view/screens/startup_screens/login_screen.dart';
import '../../../view_model/cubit/home/home_cubit.dart';
import '../../widgets/start_up_screen.dart';

class StartupScreen extends StatelessWidget {
  const StartupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubit = BlocProvider.of(context, listen: true);
    return BackgroundScaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText(
            text: 'Prototype Map',
            color: mainColor,
            fontSize: textFont20.r,
            fontWeight: FontWeight.w600,
          ),
          const SizedBox(
            height: 40,
          ),

          Wrap(
            direction: Axis.horizontal,
            spacing: 10.w,
            runSpacing: 16.h,
            alignment: WrapAlignment.spaceBetween,
            children: homeCubit.jobs
                .map(
                  (i) => StartupButton(
                    text: i,
                    onTap: () {
                      homeCubit.specialist = i;
                      context.push(const LoginScreen());
                    },
                  ),
                )
                .toList(),
          ),
        ],
      ),
    ));
  }
}
