import 'package:flutter/material.dart';
import 'package:hospital_mangement/view/core/custom_appbar.dart';
import 'package:hospital_mangement/view/core/scaffold_custom/scaffold_custom.dart';
import '../../widgets/home_screen/calls_card.dart';

class CallsScreen extends StatelessWidget {
  const CallsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldCustom(
      appBarCustom: CustomAppBar(
        title: 'Calls',
      ),
      body: ListView(
        children: const [
          CallsCard(
            name: 'Ebrahim Khaled',
            date: '20 . 02 . 2023',
          ),
          CallsCard(
            name: 'Ebrahim Khaled',
            date: '20 . 02 . 2023',
          ),
          CallsCard(
            name: 'Ebrahim Khaled',
            date: '20 . 02 . 2023',
          ),
        ],
      ),
    );
  }
}
