import 'package:flutter/material.dart';

import '../constant/color_manager.dart';

class CustomFullWidthButton extends StatelessWidget {
  const CustomFullWidthButton({
    Key? key,
    required this.text,
    required this.onPressed
    ,})
      : super(key: key);

  final String text;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: mainColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10,),
          )
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Text(
              text,
              // style: MyStyles.textStyle14.copyWith(color: MyColors.white,),
            ),
          ),
        ),
      ),
    );
  }
}
