import 'package:flutter/material.dart';
import '../../../view_model/cubit/theme/theme_cubit.dart';
import '../../constant/color_manager.dart';
import '../custom_appbar.dart';

class ScaffoldCustom extends StatelessWidget {
  final Widget body;

  final String? appBarTitle;
  final IconData? icon;
  final Function? onPressed;
  final Widget? bottomNavigationBar;
  final CustomAppBar? appBarCustom;
  final bool? condition;
  final bool? isExtend;
  final Widget? floatingActionButton;
  final Color? background;

  const ScaffoldCustom({
    Key? key,
    required this.body,
    this.appBarTitle,
    this.icon,
    this.onPressed,
    this.bottomNavigationBar,
    this.appBarCustom,
    this.condition = true,
    this.isExtend = false,
    this.floatingActionButton,
    this.background
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      extendBodyBehindAppBar: isExtend!,
      resizeToAvoidBottomInset: true,
      appBar: appBarCustom,
      // backgroundColor: background,
      backgroundColor: grey200,
      // backgroundColor: ThemeCubit.get(context).isDark ? darkBackground : white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: body,
        ),
      ),
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
    );
  }
}
