import 'package:flutter/cupertino.dart';

class MyClipper extends CustomClipper<Path> {
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;

  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 414;
    final double _yScaling = size.height / 896;
    path.cubicTo(
      60 * _xScaling,
      70 * _yScaling,
      70 * _xScaling,
      70 * _yScaling,
      60 * _xScaling,
      60 * _yScaling,
    );
    path.lineTo(0 * _xScaling, 0 * _yScaling);
    path.cubicTo(
      0 * _xScaling,
      0 * _yScaling,
      156 * _xScaling,
      0 * _yScaling,
      156 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      217.85589198104884 * _xScaling,
      3.787581006149796e-15 * _yScaling,
      268 * _xScaling,
      50.144108018951144 * _yScaling,
      268 * _xScaling,
      112 * _yScaling,
    );
    path.cubicTo(
      268 * _xScaling,
      112 * _yScaling,
      268 * _xScaling,
      268 * _yScaling,
      268 * _xScaling,
      268 * _yScaling,
    );
    path.cubicTo(
      60 * _xScaling,
      60 * _yScaling,
      70 * _xScaling,
      70 * _yScaling,
      268 * _xScaling,
      268 * _yScaling,
    );
    path.cubicTo(
      268 * _xScaling,
      268 * _yScaling,
      0 * _xScaling,
      268 * _yScaling,
      0 * _xScaling,
      268 * _yScaling,
    );
    path.cubicTo(
      60 * _xScaling,
      60 * _yScaling,
      70 * _xScaling,
      70 * _yScaling,
      0 * _xScaling,
      268 * _yScaling,
    );
    path.cubicTo(
      0 * _xScaling,
      268 * _yScaling,
      0 * _xScaling,
      0 * _yScaling,
      0 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      60 * _xScaling,
      60 * _yScaling,
      70 * _xScaling,
      70 * _yScaling,
      0 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      0 * _xScaling,
      0 * _yScaling,
      0 * _xScaling,
      0 * _yScaling,
      0 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      60 * _xScaling,
      70 * _yScaling,
      70 * _xScaling,
      70 * _yScaling,
      70 * _xScaling,
      70 * _yScaling,
    );
    return path;
  }
}
