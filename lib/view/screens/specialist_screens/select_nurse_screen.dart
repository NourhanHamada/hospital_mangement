import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hospital_mangement/view/constant/extensions.dart';
import 'package:hospital_mangement/view/core/buttons/main_button.dart';
import 'package:hospital_mangement/view/core/custom_appbar.dart';
import 'package:hospital_mangement/view/screens/specialist_screens/case_details_screen.dart';
import '../../constant/color_manager.dart';
import '../../core/scaffold_custom/scaffold_custom.dart';
import '../../widgets/home_screen/select_nurse_item.dart';

// ignore: must_be_immutable
class SelectNurseScreen extends StatelessWidget {
  SelectNurseScreen({super.key});

  SearchController searchController = SearchController();

  @override
  Widget build(BuildContext context) {
    return ScaffoldCustom(
      appBarCustom: CustomAppBar(
        title: 'Select Nurse',
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(
            Icons.close,
            color: black,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchBar(
            controller: searchController,
            onChanged: (value) {
              value = searchController.text;
              debugPrint(value);
            },
            padding: const MaterialStatePropertyAll(EdgeInsets.zero),
            leading: const Padding(
              padding: EdgeInsets.only(left: 16, right: 8),
              child: Icon(Icons.search),
            ),
            backgroundColor: const MaterialStatePropertyAll(grey200),
            elevation: const MaterialStatePropertyAll(0),
            side: const MaterialStatePropertyAll(
              BorderSide(
                color: grey500,
              ),
            ),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            hintText: 'Search for Nurse',
            hintStyle: const MaterialStatePropertyAll(
                TextStyle(fontSize: 16, color: grey700)),
          ),
          SizedBox(
            height: 16.h,
          ),
          Expanded(
            child: Column(
              children: [
                SelectNurseItem(
                  activeOrNot: greenButton,
                  selected: mainColor,
                  name: 'Salma Ahmed',
                  specialist: 'Nurse',
                ),
                SelectNurseItem(
                  activeOrNot: greenButton,
                  selected: grey500,
                  name: 'Salma Ahmed',
                  specialist: 'Nurse',
                ),
                SelectNurseItem(
                  activeOrNot: greenButton,
                  selected: grey500,
                  name: 'Salma Ahmed',
                  specialist: 'Nurse',
                ),
                SelectNurseItem(
                  activeOrNot: greenButton,
                  selected: grey500,
                  name: 'Salma Ahmed',
                  specialist: 'Nurse',
                ),
                SelectNurseItem(
                  activeOrNot: orangeButton,
                  selected: grey500,
                  name: 'Salma Ahmed',
                  specialist: 'Nurse',
                ),
                SelectNurseItem(
                  activeOrNot: orangeButton,
                  selected: grey500,
                  name: 'Salma Ahmed',
                  specialist: 'Nurse',
                ),
              ],
            ),
          ),
          MainButton(
            title: 'Select Nurse',
            onTap: () {
              context.push(const CaseDetailsScreen());
            },
          ),
        ],
      ),
    );
  }
}
