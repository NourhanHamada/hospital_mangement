import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constant/assets.dart';

//ignore: must_be_immutable
class BackgroundScaffold extends StatelessWidget {
   BackgroundScaffold({super.key, required this.body,});

  Widget body;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            up,
          ),
          Padding(
            padding: EdgeInsets.only(left: 24, right: 24, bottom: 32.h,),
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
