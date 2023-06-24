import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hospital_mangement/view/core/scaffold_custom/scaffold_custom.dart';
import '../../constant/assets.dart';

class BackgroundScaffold extends StatelessWidget {
   BackgroundScaffold({super.key, required this.body});

  Widget body;

  @override
  Widget build(BuildContext context) {
    return ScaffoldCustom(
      body: Stack(
        children: [
          Image.asset(
            up,
          ),
          Padding(
            padding: EdgeInsets.only(left: 32, right: 32, bottom: 32.h,),
            child: body,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Image.asset(
              down,
            ),
          ),
        ],
      ),
    );
  }
}
