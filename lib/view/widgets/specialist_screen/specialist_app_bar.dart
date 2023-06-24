import 'package:flutter/material.dart';
import 'package:hospital_mangement/view/constant/fonts.dart';

import '../../constant/assets.dart';
import '../../constant/color_manager.dart';


class SpecialistAppBar extends StatelessWidget {
  const SpecialistAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(profile),
               const SizedBox(
                  width: 10,
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        'Ebrahem Elzainy',
                      style:TextStyle(fontWeight: FontWeight.w600, fontSize: textFont14),
                    ),
                    Text(
                        'Specialist, Receptionist',
                      style: TextStyle(color: mainColor, fontWeight: FontWeight.w600, fontSize: textFont12),
                    ),
                  ],
                ),
              ],
            ),
            Image.asset(notification)
          ],
        ),
      ),
    );
  }
}
