import 'package:flutter/material.dart';
import 'package:hospital_mangement/view/constant/color_manager.dart';
import 'package:hospital_mangement/view/constant/extensions.dart';
import 'package:hospital_mangement/view/constant/fonts.dart';
import 'package:hospital_mangement/view/core/custom_text.dart';
import 'package:hospital_mangement/view/core/scaffold_custom/background_scaffold.dart';
import 'package:hospital_mangement/view/screens/login_screen.dart';

class StartupScreen extends StatelessWidget {
  const StartupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText(
            text: 'Prototype Map',
            color: mainColor,
            fontSize: textFont20,
            fontWeight: FontWeight.w600,
          ),
          const SizedBox(
            height: 40,
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  StartupButton(
                    text: 'Doctor',
                    onTap: () {
                      context.push(const LoginScreen());
                    },
                  ),
                  StartupButton(
                    text: 'Receptionist',
                    onTap: () {
                      context.push(const LoginScreen());
                    },
                  ),
                  StartupButton(
                    text: 'Nurse',
                    onTap: () {
                      context.push(const LoginScreen());
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  StartupButton(
                    text: 'Analysis Employee',
                    onTap: () {
                      context.push(const LoginScreen());
                    },
                  ),
                  StartupButton(
                    text: 'Manager',
                    onTap: () {
                      context.push(const LoginScreen());
                    },
                  ),
                  StartupButton(
                    text: 'HR',
                    onTap: () {
                      context.push(const LoginScreen());
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ));
  }
}

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
