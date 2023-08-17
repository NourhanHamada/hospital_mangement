import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hospital_mangement/view/constant/extensions.dart';
import 'package:hospital_mangement/view/core/custom_appbar.dart';
import 'package:hospital_mangement/view/core/scaffold_custom/scaffold_custom.dart';
import 'package:hospital_mangement/view/screens/task_screens/task_details_screen.dart';
import '../../constant/assets.dart';
import '../../constant/color_manager.dart';
import '../../widgets/tasks_and_report_card.dart';
import '../report_screens/create_report_screen.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
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
        title: 'Tasks',
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
                    context.push(const CreateReportScreen());
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
          TasksAndReportsCard(
            onTap: () {
              context.push(
                const TaskDetailsScreen(),
              );
            },
            taskName: 'Task Name',
            date: '24 . 04 . 2023',
            process: 'Finished',
          ),
          SizedBox(
            height: 8.h,
          ),
          TasksAndReportsCard(
            onTap: () {
              context.push(
                const TaskDetailsScreen(),
              );
            },
            taskName: 'Task Name',
            date: '24 . 04 . 2023',
            process: 'Process',
          ),
        ],
      ),
    );
  }
}
