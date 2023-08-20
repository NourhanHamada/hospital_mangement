import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hospital_mangement/view/constant/assets.dart';
import 'package:hospital_mangement/view/constant/color_manager.dart';
import 'package:hospital_mangement/view/constant/extensions.dart';
import 'package:hospital_mangement/view/core/buttons/custom_button.dart';
import 'package:hospital_mangement/view/core/custom_appbar.dart';
import 'package:hospital_mangement/view/core/custom_text.dart';
import 'package:hospital_mangement/view/core/scaffold_custom/scaffold_custom.dart';

class NurseCallsScreen extends StatelessWidget {
  const NurseCallsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldCustom(
        appBarCustom: CustomAppBar(
          title: 'Calls',
        ),
        body: SizedBox(
          height: context.screenHeight,
          child: ListView.builder(
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        const IconWithTitleItem(
                          icon: user2,
                          text: 'Name',
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const IconWithTitleItem(
                          icon: user2,
                          text: 'dr name',
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const IconWithTitleItem(
                          icon: calendar,
                          text: 'date',
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomButton(
                              width: 150,
                              color: greenButton,
                              onClick: () {},
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(color: white)),
                                    child: const Icon(
                                      Icons.done,
                                      color: white,
                                      size: 16,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  CustomText(text: 'Accept'),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 24,
                            ),
                            CustomButton(
                              width: 150,
                              color: orangeButton,
                              onClick: () {},
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(color: white)),
                                    child: const Icon(
                                      Icons.close,
                                      color: white,
                                      size: 16,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  CustomText(text: 'Busy'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ));
  }
}

class IconWithTitleItem extends StatelessWidget {
  const IconWithTitleItem({
    super.key,
    required this.icon,
    required this.text,
  });

  final String icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: mainColor,
            borderRadius: BorderRadius.circular(4),
          ),
          padding: const EdgeInsets.all(4),
          child: SvgPicture.asset(
            icon,
            fit: BoxFit.scaleDown,
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        CustomText(
          text: text,
          color: black,
        )
      ],
    );
  }
}
