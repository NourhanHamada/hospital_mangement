import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_mangement/view/constant/color_manager.dart';
import 'package:hospital_mangement/view/core/buttons/custom_button.dart';
import 'package:hospital_mangement/view/core/buttons/main_button.dart';
import 'package:hospital_mangement/view/core/custom_appbar.dart';
import 'package:hospital_mangement/view/core/custom_text.dart';
import 'package:hospital_mangement/view_model/cubit/receptionist_case_details/receptionist_case_details_cubit.dart';
import '../../core/scaffold_custom/scaffold_custom.dart';

class ReceptionistCaseDetailsScreen extends StatelessWidget {
  const ReceptionistCaseDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ReceptionistCaseDetailsCubit receptionistCaseDetailsCubit =
        BlocProvider.of<ReceptionistCaseDetailsCubit>(
      context,
      listen: true,
    );
    return ScaffoldCustom(
      appBarCustom: CustomAppBar(
        title: 'Case Details',
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ReceptionistCaseDetailsItem(
                  title: 'Patient Name',
                  subTitle: 'Ebrahim Khaled',
                ),
                const ReceptionistCaseDetailsItem(
                  title: 'Age',
                  subTitle: '24 Years',
                ),
                const ReceptionistCaseDetailsItem(
                  title: 'Phone Number',
                  subTitle: '01012345678',
                ),
                const ReceptionistCaseDetailsItem(
                  title: 'Date',
                  subTitle: '24 . 04 . 2021',
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: 'Status',
                      color: grey600,
                      fontWeight: FontWeight.w600,
                    ),
                    Row(
                      children: [
                        CustomText(
                          text: !receptionistCaseDetailsCubit.isLogOut
                              ? 'Process'
                              : 'Finished',
                          color: black,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Container(
                          padding: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: !receptionistCaseDetailsCubit.isLogOut
                                ? orange
                                : greenButton,
                          ),
                          child: !receptionistCaseDetailsCubit.isLogOut
                              ? const Icon(
                                  Icons.av_timer_outlined,
                                  color: white,
                                  size: 18,
                                )
                              : const Icon(
                                  Icons.done,
                                  color: white,
                                  size: 18,
                                ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomText(
                  text: 'Case Details',
                  color: grey600,
                  fontWeight: FontWeight.w600,
                ),
                CustomText(
                  text: 'Details Note: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s',
                  color: black,
                ),
              ],
            ),
          ),
          receptionistCaseDetailsCubit.isLogOut
              ? MainButton(
                  title: 'Case has been logged out',
                  color: grey500,
                  textColor: grey600,
                  onTap: () {},
                )
              : CustomButton(
                  onClick: () {
                    receptionistCaseDetailsCubit.logout(context);
                  },
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: 'Logout',
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      const Icon(
                        Icons.logout,
                        color: white,
                      ),
                    ],
                  ),
                  color: red,
                ),
        ],
      ),
    );
  }
}

class ReceptionistCaseDetailsItem extends StatelessWidget {
  const ReceptionistCaseDetailsItem(
      {super.key, required this.title, required this.subTitle});

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text: title,
            color: grey600,
            fontWeight: FontWeight.w600,
          ),
          CustomText(
            text: subTitle,
            color: black,
          ),
        ],
      ),
    );
  }
}
