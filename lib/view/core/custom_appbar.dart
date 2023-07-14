import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constant/color_manager.dart';
import '../constant/fonts.dart';
import 'custom_text.dart';

//used to make appbar in most of project
//ignore: must_be_immutable
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(60);
  String title;
  Function? onPressed;
  bool showLeading;
  List<Widget> actions;
  Color colorAppBar;
  Color colorTxtAppBar;
  Widget? leading;

  CustomAppBar({
    this.showLeading = true,
    this.title = " ",
     this.onPressed,
    this.colorAppBar = transparent,
    this.colorTxtAppBar = whiteColor,
    this.actions = const [],
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      elevation: 0,
      backgroundColor: colorAppBar,
      centerTitle: true,
      title: Padding(
        padding: EdgeInsets.only(top: 0.h),
        child: CustomText(
          text: title.tr().toString(),
          color: colorTxtAppBar,
          fontSize: textFont18,
        ),
      ),
      actions: actions,
    );
  }
}
