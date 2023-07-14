import 'package:flutter/material.dart';
import 'package:hospital_mangement/view/constant/extensions.dart';
import 'package:hospital_mangement/view/core/custom_appbar.dart';
import 'package:hospital_mangement/view/core/scaffold_custom/scaffold_custom.dart';
import 'package:hospital_mangement/view/screens/specialist_screens/case_details_screen.dart';
import 'package:hospital_mangement/view/widgets/home_screen/cases_card.dart';

class CasesScreen extends StatelessWidget {
  const CasesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldCustom(
      appBarCustom: CustomAppBar(
        title: 'Cases',
      ),
      body: ListView(
        children: [
          GestureDetector(
            onTap: () {
              context.push(const CaseDetailsScreen());
            },
            child: const CasesCard(
              name: 'Ahmed',
              date: '24 . 02 . 2023',
            ),
          ),
          const CasesCard(
            name: 'Ahmed',
            date: '24 . 02 . 2023',
          ),
          const CasesCard(
            name: 'Ahmed',
            date: '24 . 02 . 2023',
          ),
        ],
      ),
    );
  }
}
