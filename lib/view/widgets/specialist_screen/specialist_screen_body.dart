import 'package:flutter/material.dart';
import 'package:hospital_mangement/view/widgets/specialist_screen/specialist_cards.dart';

import 'specialist_app_bar.dart';

class SpecialistScreenBody extends StatelessWidget {
  const SpecialistScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children:  [
          SpecialistAppBar(),
          SpecialistCards(),
        ],
      ),
    );
  }
}