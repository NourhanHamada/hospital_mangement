import 'package:flutter/material.dart';
import '../constant/color_manager.dart';
import '../core/custom_text.dart';

// ignore: must_be_immutable
class StartupButton extends StatelessWidget {
  StartupButton({super.key, required this.text, required this.onTap});

  String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            10,
          ),
          border: Border.all(
            color: grey800,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: CustomText(
            text: text,
            color: mainColor,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}