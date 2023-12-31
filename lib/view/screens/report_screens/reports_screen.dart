import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hospital_mangement/view/constant/color_manager.dart';
import 'package:hospital_mangement/view/constant/extensions.dart';
import 'package:hospital_mangement/view/core/custom_appbar.dart';
import 'package:hospital_mangement/view/core/scaffold_custom/scaffold_custom.dart';
import 'package:hospital_mangement/view/screens/report_screens/report_details_screen.dart';
import 'package:in_date_utils/in_date_utils.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../constant/assets.dart';
import '../../widgets/tasks_and_report_card.dart';
import 'create_report_screen.dart';

// ignore: must_be_immutable
class ReportsScreen extends StatefulWidget {
  const ReportsScreen({super.key});

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  TextEditingController dateController = TextEditingController();
  var _selectedDay = DateTime.now();
  var _focusDay;

  @override
  Widget build(BuildContext context) {

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
                    showModalBottomSheet(
                      context: context,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      builder: (BuildContext context) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TableCalendar(
                            calendarStyle: CalendarStyle(
                              rangeHighlightColor: mainColor,
                              todayDecoration: const BoxDecoration(
                                color: Colors.transparent,
                                shape: BoxShape.circle,
                              ),
                              todayTextStyle: const TextStyle(
                                color: mainColor,
                              ),
                              selectedDecoration: BoxDecoration(
                                  color: mainColor.withOpacity(.1),
                                  shape: BoxShape.circle),
                              selectedTextStyle: const TextStyle(
                                color: mainColor,
                              ),
                            ),
                            onDaySelected: (selectedDay, focusDay) {
                              setState(() {
                                _selectedDay = selectedDay;
                                _focusDay = focusDay;
                                dateController.text =
                                    DateFormat('dd . MM . yyyy')
                                        .format(_selectedDay);
                                context.pop();
                              });
                            },
                            selectedDayPredicate: (day) {
                              return isSameDay(_selectedDay, day);
                            },
                            daysOfWeekHeight: 30,
                            focusedDay: DateTime.now(),
                            firstDay: DateTime.now(),
                            // lastDay: DateTime.utc(2023, 10, 10),
                            lastDay: DTU.lastDayOfMonth(
                              DateTime.now(),
                            ),
                          ),
                        );
                      },
                    );
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
                const ReportDetailsScreen(),
              );
            },
            taskName: 'Report Name',
            date: '24 . 04 . 2023',
            process: 'Finished',
          ),
          SizedBox(
            height: 8.h,
          ),
          TasksAndReportsCard(
            onTap: () {
              context.push(
                const ReportDetailsScreen(),
              );
            },
            taskName: 'Report Name',
            date: '24 . 04 . 2023',
            process: 'Process',
          ),
        ],
      ),
    );
  }
}
