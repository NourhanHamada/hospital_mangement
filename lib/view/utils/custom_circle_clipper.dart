import 'dart:math';

import 'package:flutter/cupertino.dart';



class CustomRoundedRectangleClipper extends CustomClipper<Path> {
  final double borderRadius;

  CustomRoundedRectangleClipper(this.borderRadius);

  @override
  Path getClip(Size size) {
    final path = Path();

    path.moveTo(borderRadius, 0);
    path.lineTo(size.width - borderRadius, 0);
    path.arcToPoint(
      Offset(size.width, borderRadius),
      radius: Radius.circular(borderRadius),
    );
    path.lineTo(size.width, size.height - borderRadius);
    path.arcToPoint(
      Offset(size.width - borderRadius, size.height),
      radius: Radius.circular(borderRadius),
    );
    path.lineTo(borderRadius, size.height);
    path.arcToPoint(
      Offset(0, size.height - borderRadius),
      radius: Radius.circular(borderRadius),
    );
    path.lineTo(0, borderRadius);
    path.arcToPoint(
      Offset(borderRadius, 0),
      radius: Radius.circular(borderRadius),
    );

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomRoundedRectangleClipper oldClipper) =>
      oldClipper.borderRadius != borderRadius;
}

// class PartialCircleClipper extends CustomClipper<Path> {
//   final double fraction;
//
//   PartialCircleClipper(this.fraction);
//
//   @override
//   Path getClip(Size size) {
//     final path = Path();
//     final angle = 2 * pi * fraction;
//     final center = Offset(size.width / 2, size.height / 2);
//     final radius = min(size.width / 2, size.height / 2);
//
//     path.moveTo(center.dx, center.dy);
//     path.arcTo(
//         Rect.fromCircle(center: center, radius: radius),
//         -pi / 2,
//         angle,
//         false);
//     path.close();
//
//     return path;
//   }
//
//   @override
//   bool shouldReclip(PartialCircleClipper oldClipper) =>
//       oldClipper.fraction != fraction;
// }