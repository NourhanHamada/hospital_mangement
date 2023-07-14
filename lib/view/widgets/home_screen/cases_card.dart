import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constant/color_manager.dart';
import '../../core/custom_text.dart';
import 'card_upper_case.dart';

class CasesCard extends StatelessWidget {
  const CasesCard({
    super.key,
    required this.name,
    required this.date,
  });

  final String name;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 16.sp),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
             CardUpperCase(
              name: name,
              date: date,
            ),
            Container(
              width: ScreenUtil().screenWidth / 1.6,
              decoration: BoxDecoration(
                color: greenButton,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: CustomText(text: 'Show Details'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
