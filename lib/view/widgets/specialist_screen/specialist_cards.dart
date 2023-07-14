import 'package:flutter/material.dart';
import 'package:hospital_mangement/view/widgets/specialist_screen/specialist_card.dart';

import '../../constant/assets.dart';
import '../../constant/color_manager.dart';

class SpecialistCards extends StatelessWidget {
  const SpecialistCards({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            // GoRouter.of(context).push('/callsScreenBody');
            Navigator.pushNamed(context, '/callsScreen');
          },
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20, right: 20),
                child: Cards(
                  height: 192,
                  color: blueCard,
                  icon: Image.asset(calls),
                  text: 'Calls',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Cards(
                  height: 158,
                  color: mauveCard,
                  icon: Image.asset(document),
                  text: 'Reports',
                ),
              ),
            ],
          ),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Cards(
                height: 158,
                color: greenCard,
                icon: Image.asset(tasks),
                text: 'Tasks',
              ),
            ),
            Cards(
              height: 192,
              color: lightBlueCard,
              icon: Image.asset(fingerPrint),
              text: 'attendance - leaving',
            ),
          ],
        ),
      ],
    );
  }
}
