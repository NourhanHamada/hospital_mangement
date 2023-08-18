import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_mangement/view/core/scaffold_custom/scaffold_custom.dart';
import 'package:hospital_mangement/view/screens/hr_screens/hr_screen.dart';
import 'package:hospital_mangement/view/screens/receptionist_screens/receptionist_screen.dart';
import 'package:hospital_mangement/view/screens/specialist_screens/doctor_screen.dart';
import 'package:hospital_mangement/view_model/cubit/home/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubit = BlocProvider.of(context, listen: true);
    return ScaffoldCustom(
      body: homeCubit.specialist == 'Doctor'
          ? const DoctorScreen()
          : homeCubit.specialist == 'Receptionist'
              ? const ReceptionistScreen()
              : homeCubit.specialist == 'HR'
                  ? const HRScreen()
                  : const Center(
                      child: Text('Home Screen'),
                    ),
    );
  }
}
