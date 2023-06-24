import 'package:flutter/material.dart';
import 'package:hospital_mangement/view/constant/fonts.dart';

import '../../constant/color_manager.dart';

class Cards extends StatelessWidget {
  const Cards(
      {Key? key,
      required this.height,
      required this.color,
      required this.icon,
      required this.text})
      : super(key: key);

  final double height;
  final Color color;
  final Image icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
      width: 163,
      height: height,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 66,
              height: 66,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: white),
                  color: Colors.transparent),
              child: icon,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              text,
              style: const TextStyle(
                  color: white,
                  fontWeight: FontWeight.w600,
                  fontSize: textFont14),
            )
          ],
        ),
      ),
    );
  }
}
