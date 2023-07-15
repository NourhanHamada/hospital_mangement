import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constant/color_manager.dart';
import '../core/custom_text.dart';

class SearchBarCustom extends StatelessWidget {
  const SearchBarCustom({
    super.key,
    required this.onTap,
  });

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: grey500,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              const Icon(
                Icons.search,
              ),
              SizedBox(
                width: 8.w,
              ),
              CustomText(
                text: 'Search for Nurse',
                color: grey600,
                fontSize: 14,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
