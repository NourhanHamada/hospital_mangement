import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hospital_mangement/view/constant/extensions.dart';
import 'package:hospital_mangement/view/core/custom_appbar.dart';
import 'package:hospital_mangement/view/core/custom_text.dart';
import 'package:hospital_mangement/view/core/scaffold_custom/scaffold_custom.dart';
import 'package:hospital_mangement/view/screens/receptionist_screens/receptionist_case_details_screen.dart';
import 'package:hospital_mangement/view/screens/receptionist_screens/receptionist_create_call_screen.dart';
import 'package:in_date_utils/in_date_utils.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../constant/assets.dart';
import '../../constant/color_manager.dart';

class ReceptionistCallsScreen extends StatefulWidget {
  const ReceptionistCallsScreen({super.key});

  @override
  State<ReceptionistCallsScreen> createState() =>
      _ReceptionistCallsScreenState();
}

class _ReceptionistCallsScreenState extends State<ReceptionistCallsScreen> {
  TextEditingController dateController = TextEditingController();
  var _selectedDay = DateTime.now();
  var _focusDay;

  @override
  Widget build(BuildContext context) {
    return ScaffoldCustom(
      appBarCustom: CustomAppBar(
        title: 'Calls',
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
                        // _selectedDay.toString(),
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
                    context.push(const ReceptionistCreateCallScreen());
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
          const SizedBox(
            height: 32,
          ),
          GestureDetector(
            onTap: (){
              context.push(const ReceptionistCaseDetailsScreen());
            },
            child: Card(
              elevation: 5,
              color: white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                color: mainColor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: SvgPicture.asset(
                                  user2,
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            CustomText(
                              text: 'text',
                              color: black,
                              fontSize: 14,
                            ),
                          ],
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            color: greenButton,
                            shape: BoxShape.circle,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Icon(
                              Icons.av_timer,
                              size: 16,
                              color: white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: mainColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: SvgPicture.asset(
                              calendar,
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        CustomText(
                          text: dateController.text,
                          color: black,
                          fontSize: 14,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
