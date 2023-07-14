import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constant/color_manager.dart';
import '../../core/custom_text.dart';

class CaseDetailsItem extends StatelessWidget {
  const CaseDetailsItem({
    super.key,
    required this.text,
    required this.infoDetails,
    required this.isNeedIcon,
  });

  final String text;
  final String infoDetails;
  final bool isNeedIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text: text,
            color: grey600,
            fontWeight: FontWeight.w500,
          ),
          Row(
            children: [
              CustomText(
                text: infoDetails,
                color: grey900,
              ),
              Container(
                child: isNeedIcon
                    ? Padding(
                    padding: EdgeInsets.only(left: 8.w),
                    child: Container(
                      padding: const EdgeInsets.all(1),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: orange),
                      child: const Icon(
                        Icons.av_timer,
                        color: white,
                        size: 16,
                      ),
                    ))
                    : null,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

