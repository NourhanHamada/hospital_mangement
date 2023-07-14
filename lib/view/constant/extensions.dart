import 'package:flutter/material.dart';

extension MediaQueryHelper on BuildContext {
  double get screenHeight => MediaQuery.of(this).size.height;
  double get screenWidth => MediaQuery.of(this).size.width;
}

extension NavigatorHelper on BuildContext {
  void push(Widget widget) {
    Navigator.of(this).push(MaterialPageRoute(
      builder: (context) => widget,
    ));
  }

  void pop(){
    Navigator.of(this).pop();
  }
}
