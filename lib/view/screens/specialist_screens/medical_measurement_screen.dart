import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hospital_mangement/view/constant/extensions.dart';
import 'package:hospital_mangement/view/core/custom_appbar.dart';
import 'package:hospital_mangement/view/core/custom_text.dart';
import 'package:hospital_mangement/view/core/scaffold_custom/scaffold_custom.dart';
import '../../constant/color_manager.dart';

class MedicalMeasurementScreen extends StatelessWidget {
  const MedicalMeasurementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldCustom(
      appBarCustom: CustomAppBar(
        title: 'Medical measurement',
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
        children: [
          Wrap(
            runSpacing: 12.0,
            spacing: 12.0,
            children: [
              GestureDetector(
                child: Container(
                  width: 150,
                  decoration: BoxDecoration(
                    color: mainColor,
                    borderRadius: BorderRadius.circular(
                      5,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        CustomText(
                          text: 'Blood Pressure',
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        const Icon(
                          Icons.close,
                          color: white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                child: Container(
                  width: 150,
                  decoration: BoxDecoration(
                    color: mainColor,
                    borderRadius: BorderRadius.circular(
                      5,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        CustomText(
                          text: 'Blood Pressure',
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        const Icon(
                          Icons.close,
                          color: white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                child: Container(
                  width: 185,
                  decoration: BoxDecoration(
                    color: grey200,
                    borderRadius: BorderRadius.circular(
                      5,
                    ),
                    border: Border.all(color: grey400)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        CustomText(
                          text: 'Add measurement',
                          color: grey600,
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        const Icon(
                          Icons.add,
                          color: grey600,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 32.h,
          ),
          TextField(
            maxLines: 3,
              textAlignVertical: TextAlignVertical.top,
              textAlign: TextAlign.start,
              decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none
              ),
              hintText: 'Add Note',
              hintStyle: TextStyle(
                color: grey600
              ),
                  alignLabelWithHint: true,
                  filled: true,
              fillColor: grey300
            ),
          ),
        ],
      ),
    );
  }
}
