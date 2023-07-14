import 'package:flutter/material.dart';
import 'package:hospital_mangement/view/constant/color_manager.dart';

import '../constant/assets.dart';
import '../constant/fonts.dart';


class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Image.asset(arrowBack),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: textFont16,
          color: black
        )
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }
}
